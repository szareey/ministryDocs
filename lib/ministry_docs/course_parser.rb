module MinistryDocs
  class CourseParser
    attr_writer :strat_parser

    def parse(courses)
      parse_courses(courses).collect do |course|
        OpenStruct.new(
          code: parse_code(course),
          title: parse_title(course),
          grade: parse_grade(course),
          pre_req: parse_pre_req(course),
          description: parse_description(course),
          strands: strat_parser.parse(course)
        )
      end
    end

    def parse_courses(courses)
      positions = courses
                  .enum_for(:scan, /^.*, Grade [0-9]* $/)
                  .map { Regexp.last_match.begin(0) }

      # adding last position
      last_position = courses.index('The Ministry of Education') - 1

      positions.each_with_index.collect do |pos, index|
        second_pos = if index == positions.count - 1
                       last_position
                     else
                       positions[index + 1] - 1
                     end

        courses[pos..second_pos]
      end
    end

    def parse_code(course)
      course.lines[2].split(' ').last
    end

    def parse_title(course)
      course.lines[0].split(',').first
    end

    def parse_grade(course)
      course.lines[0].split(',').last.strip
    end

    def parse_pre_req(course)
      course.each_line do |line|
        if line.include? 'Prerequisite:'
          return line['Prerequisite:'.length..-1].strip
        end
      end
    end

    def parse_description(course)
      course.lines[4].strip
    end

    def strat_parser
      @strat_parser ||= StratParser.new
    end
  end
end
