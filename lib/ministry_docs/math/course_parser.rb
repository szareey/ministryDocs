module MinistryDocs
  module Math
    class CourseParser
      def initialize(course)
        @course = course
      end

      def parse
        OpenStruct.new(
          code: code,
          title: title,
          grade: grade,
          preReq: preReq,
          description: description
        )
      end

      private
      
      def code
        @course.lines[2].split(" ").last
      end

      def title
        @course.lines[0].split(",").first
      end

      def grade 
        @course.lines[0].split(",").last.strip
      end

      def preReq
        @course.each_line do |line|
          if line.include? 'Prerequisite:'
            return line['Prerequisite:'.length..-1].strip
          end
        end
      end

      def description
        @course.lines[4].strip
      end
    end
  end
end