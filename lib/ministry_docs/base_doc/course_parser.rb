module MinistryDocs
  module BaseDoc
    class CourseParser < BaseParser
      attr_writer :strat_parser

      def parse(courses)
        parse_courses(courses).collect do |course|
          OpenStruct.new(
            code: parse_code(course),
            title: parse_title(course),
            grade: parse_grade(course),
            pre_req: parse_pre_req(course),
            description: parse_description(course),
            strands: strand_parser.parse(course)
          )
        end
      end

      protected

      def strand_parser
        raise NotImplementedError
      end
    end
  end
end