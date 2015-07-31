module MinistryDocs
  module Math2007Doc
    class ExpectationParser < MinistryDocs::BaseDoc::ExpectationParser
      OVERALL = /^OVERALL EXPECTATIONS/
      SPECIFIC = /^SPECIFIC EXPECTATIONS/

      attr_writer :specific_parser

      def specific_parser
        @specific_parser || SpecificParser.new
      end

      private

      def parse_shorthand(specific)
        sections = specific
                   .enum_for(:scan, /^(([0-9])\. (.*))$/)
                   .collect do |spec|
          {
            title: spec[2],
            part:  spec[1],
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
            part: section[:part],
            content: specific[section[:pos][:to]..second_pos].strip
          }
        end
      end

      def parse_overall(overall)
        list = overall.scan(/^([0-9])\.(.*)$/)
        list.collect do |section|
          {
            part: section[0],
            value: section[1].strip.chop
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
end
