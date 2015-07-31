module MinistryDocs
  module BaseDoc
    class DocParser < BaseParser
      attr_writer :course_parser

      def parse_course(text)
        course_parser.parse(get_courses_section(text))
      end

      protected

      def course_parser
        raise NotImplementedError
      end

      def normlize(text)
        text.gsub(/\r/," ")
      end
    end
  end
end