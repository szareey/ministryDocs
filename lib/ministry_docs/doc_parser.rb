module MinistryDocs
  class DocParser
    attr_writer :course_parser

    def parse_course(text)
      course_parser.parse(get_courses_section(text))
    end

    private

    def course_parser
      @course_parser ||= CourseParser.new
    end

    def get_courses_section(text)
      text.split(/^COURSES  $/)[1]
    end
  end
end
