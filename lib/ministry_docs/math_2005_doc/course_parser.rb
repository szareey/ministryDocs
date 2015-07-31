module MinistryDocs
  module Math2005Doc
    class CourseParser < MinistryDocs::BaseDoc::CourseParser

      def parse_courses(courses)
        courses_index = get_courses_index(courses)
        courses_index.each_with_index.collect do |from, index|
          to = if index == courses_index.size - 1
                 courses.index('Glossary') -1
               else
                 courses_index[index+1] - 1
               end
          courses[from..to].strip
        end
      end

      def get_courses_index(courses)
        courses
          .enum_for(:scan, /^.*\(.{5}\) $/)
          .collect do |match|
          Regexp.last_match.begin(0)
        end
      end

      def parse_grade(course)
        course.lines[0].split(',')[1].strip
      end

      #I think this is the best way
      def parse_pre_req(course)
        ''
      end

      def parse_title(course)
        course.lines[0].split(',')[0]
      end

      def parse_code(course)
        course.lines[0].scan(/\((.*)\)/)[0][0]
      end

      def parse_description(course)
        course.lines[1].strip
      end

      protected

      def strand_parser
        @strand_parser ||= StrandParser.new
      end
    end
  end
end