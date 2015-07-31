module MinistryDocs
  module Math2007Doc
    class StrandParser < MinistryDocs::BaseDoc::StrandParser

      

      private

      def parse_strat(course)
        strats = course
                 .enum_for(:scan, /^([A-Z])\.(.*)$/)
                 .map do |match|
          {
            part: match[0],
            title: match[1].strip,
            pos: {
              from: Regexp.last_match.begin(0),
              to: Regexp.last_match.end(0)
            }
          }
        end
        get_content_by_pos course, strats
      end

      def get_content_by_pos(course, strats)
        strats.each_with_index.collect do |strat, index|
          second_pos = if index == strats.count - 1
                         -1
                       else
                         strats[index + 1][:pos][:from] - 1
                       end
          {
            part: strat[:part],
            title: strat[:title],
            content: course[strat[:pos][:to]..second_pos].strip
          }
        end
      end

      def expectation_parser
        @expectation_parser || ExpectationParser.new
      end
    end
  end
end
