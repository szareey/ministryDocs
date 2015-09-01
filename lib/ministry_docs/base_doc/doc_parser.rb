module MinistryDocs
  module BaseDoc
    class DocParser < BaseParser
      attr_writer :course_parser

      def parse_course(text)
        OpenStruct.new(info(
          course_parser.parse(get_courses_section(text))
        ))
      end

      protected

      def info(courses)
        raise NotImplementedError
      end

      def course_parser
        raise NotImplementedError
      end

      def normlize(text)
        text.gsub(/\r/," ")
      end
    end
  end
end