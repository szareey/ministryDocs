module MinistryDocs
  class Parser
    def getCoursesSection(text)
      text.split(/^COURSES  $/)[1]
    end

    def getCoursesRange(course_section)
      positions = course_section
                    .enum_for(:scan, /^.*, Grade [0-9]* $/)
                    .map { Regexp.last_match.begin(0) }

      #adding last position
      last_position = course_section.index('The Ministry of Education') - 1

      positions.each_with_index.collect do |pos, index|
        second_pos = if index == positions.count - 1 
         last_position 
        else 
          positions[index + 1] - 1
        end

        Range.new(pos, second_pos)
      end
    end
  end
end
