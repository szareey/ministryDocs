module MinistryDocs
  module Math2007Doc
    class DocParser < MinistryDocs::BaseDoc::DocParser
      protected

      def course_parser
        @course_parser ||= CourseParser.new
      end

      def get_courses_section(text)
        normlize(text).split('COURSES  ')[1]
      end
    end
  end
end
