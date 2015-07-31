module MinistryDocs
  module Math2005Doc
    class ExpectationParser < MinistryDocs::BaseDoc::ExpectationParser
      OVERALL = /^Overall Expectations/
      SPECIFIC = /Specific Expectations/

      private

      def parse_overall(overall)
        list = overall.scan(/^•(.*)$/)
        list.collect do |section|
          {
            value: section[0].strip.chop
          }
        end
      end

      def parse_shorthand(specific)
        shorthands = specific.lines.each_with_index.collect do |line, index|
          if line.include? 'By the end of this course, students will:'
            {
              title: specific.lines[index-1],
              pos: {
                to: specific.index(specific.lines[index-1]),
                from: specific.index(specific.lines[index+1]) 
              } 
            }
          end
        end.reject(&:nil?)
        pos_to_content shorthands, specific
      end

      def pos_to_content(shorthands, specific)
        shorthands.each_with_index.collect do |shorthand, index|
          to = if index == shorthands.size - 1
                 -1
               else
                 shorthands[index+1][:pos][:to] - 1
               end
          {
            part: (index + 1).to_s,
            title: shorthand[:title].strip,
            content: specific[shorthand[:pos][:from]..to].strip
          }
        end
      end

      def normalize(strat)
        unless strat.include? 'Specific Expectations'
          strat.scan(/^•(.*)$/)
          pos =  Regexp.last_match.end(0)
          strat[pos] = "\nSpecific Expectations\n"
        end

        strat.gsub(/\[\*.*\]/, "")
             .gsub(';*', ';')
             .gsub('Investigating Constant Rate of Change', "\nInvestigating Constant Rate of Change\n")
             .strip
      end

      def specific_parser
        @specific_parser || SpecificParser.new
      end
    end
  end
end