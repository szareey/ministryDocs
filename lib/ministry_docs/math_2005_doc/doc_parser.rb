module MinistryDocs
  module Math2005Doc
    class DocParser < MinistryDocs::BaseDoc::DocParser
      protected

      def course_parser
        @course_parser ||= CourseParser.new
      end

      def get_courses_section(text)
        normlize(text)
          .split("Teachers must preview and plan activities and expeditions carefully to protect students’ health and safety.")[1]
          .gsub(/(\n *){2,}/, "\n").strip
      end
    end
  end
end