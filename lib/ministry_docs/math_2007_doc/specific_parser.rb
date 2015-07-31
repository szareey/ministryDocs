module MinistryDocs
  module Math2007Doc
    class SpecificParser < MinistryDocs::BaseDoc::SpecificParser
      private

      def parse_sections(content, part=nil) 
        sections = parse_parts(content)
        sections.each_with_index.collect do |part, index|
          second_pos = if index == sections.count - 1
                         -1
                       else
                         sections[index + 1][:pos][:from] - 1
                       end
          {
            part: part[:part],
            description: content[part[:pos][:to]..second_pos].strip
          }
        end
      end

      def parse_parts(content)
        content.enum_for(:scan, /^([0-9]\.[0-9])/m)
               .collect do |part|
                 {
                   part: part[0],
                   pos: {
                     from: Regexp.last_match.begin(0),
                     to: Regexp.last_match.end(0)
                   }
                 }
               end
      end
    end
  end
end
