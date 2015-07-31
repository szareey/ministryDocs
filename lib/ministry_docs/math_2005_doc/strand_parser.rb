module MinistryDocs
  module Math2005Doc
    class StrandParser < MinistryDocs::BaseDoc::StrandParser

      def parse_strat(course)
        strats_with_index = get_srats_with_index(course)
        strats_with_index.each_with_index.collect do |strat, index|
          to = if index == strats_with_index.size - 1
                 -1
               else
                 strats_with_index[index+1][:pos] - 1
               end
          {
            title: strat[:title],
            part: (index+'A'.ord).chr,
            content: course[strat[:pos]..to].strip
          }
          
        end
      end

      def get_srats_with_index(course)
        course.lines.each_with_index.collect do |line, index|
          if line[/^Overall Expectations/]
            {
              title: course.lines[index-1].strip,
              pos: course.index(course.lines[index-1])
            }
          end
        end.reject(&:nil?)
      end

      def expectation_parser
        @expectation_parser || ExpectationParser.new
      end
    end
  end
end