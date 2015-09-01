module MinistryDocs
  module Math2007Doc
    class DocParser < MinistryDocs::BaseDoc::DocParser
      PDF_URL = 'https://www.edu.gov.on.ca/eng/curriculum/secondary/math1112currb.pdf'
      TXT_URL = 'https://www.edu.gov.on.ca/eng/curriculum/secondary/math1112currb.txt'
      
      protected

      def info(courses)
        {
          courses: courses,
          subject: 'math',
          province: 'Ontario',
          pdf_url: PDF_URL,
          txt_url: TXT_URL,
          title: 'The Ontario Curriculum, Grades 11 and 12: Mathematics',
          grades: [11, 12],
          year: '2007'
        }
      end

      def course_parser
        @course_parser ||= CourseParser.new
      end

      def get_courses_section(text)
        normlize(text).split('COURSES  ')[1]
      end
    end
  end
end
