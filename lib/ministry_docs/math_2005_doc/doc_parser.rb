module MinistryDocs
  module Math2005Doc
    class DocParser < MinistryDocs::BaseDoc::DocParser
      PDF_URL = 'https://www.edu.gov.on.ca/eng/curriculum/secondary/math910curr.pdf'
      TXT_URL = 'https://www.edu.gov.on.ca/eng/curriculum/secondary/math910curr.txt'
      
      protected

      def info(courses)
        {
          courses: courses,
          subject: 'math',
          province: 'Ontario',
          pdf_url: PDF_URL,
          txt_url: TXT_URL,
          title: 'The Ontario Curriculum, Grades 9 and 10: Mathematics',
          grades: [9, 10],
          year: '2005'
        }
      end

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