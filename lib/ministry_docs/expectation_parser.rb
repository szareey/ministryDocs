module MinistryDocs
  class ExpectationParser
    OVERALL = "OVERALL EXPECTATIONS \n"
    SPECIFIC = "SPECIFIC EXPECTATIONS  \n"

    attr_writer :specific_parser

    def parse(strat)
      shorthand, overall = parse_sections(strat)
      shorthand.each_with_index.collect do |short, index|
        OpenStruct.new(
          title: short[:title],
          description: overall[index][:value],
          path: short[:path],
          specifics: specific_parser.parse(short[:content])
        )
      end
    end

    def specific_parser
      @specific_parser || SpecificParser.new
    end

    private

    def parse_sections(strat)
      strat = normalize(strat)

      overall = strat.index(OVERALL)
      specific = strat.index(SPECIFIC)

      [
        parse_shorthand(strat[specific + SPECIFIC.length..-1].strip),
        parse_overall(strat[overall + OVERALL.length..specific].strip)
      ]
    end

    def parse_shorthand(specific)
      sections = specific
                 .enum_for(:scan, /^(([0-9])\. (.*))$/)
                 .map do |spec|
        {
          title: spec[2],
          path:  spec[1],
          pos: {
            from: Regexp.last_match.begin(0),
            to: Regexp.last_match.end(0)
          }
        }
      end
      get_content_by_pos specific, sections
    end

    def get_content_by_pos(specific, sections)
      sections.each_with_index.collect do |section, index|
        second_pos = if index == sections.count - 1
                       -1
                     else
                       sections[index + 1][:pos][:from] - 1
                     end
        {
          title: section[:title].strip,
          path: section[:path],
          content: specific[section[:pos][:to]..second_pos].strip
        }
      end
    end

    def parse_overall(overall)
      list = overall.scan(/^([0-9])\.(.*)$/)
      list.collect do |section|
        {
          path: section[0],
          value: section[1].strip.chop.capitalize
        }
      end
    end

    def normalize(text)
      text
        .gsub('By the end of this course, students will:', '')
        .gsub(/^(\*.*)$/, '')
    end
  end
end
