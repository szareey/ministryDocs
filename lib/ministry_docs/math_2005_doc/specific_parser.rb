module MinistryDocs
  module Math2005Doc
    class SpecificParser < MinistryDocs::BaseDoc::SpecificParser
      protected

      def parse_sections(content, part) 
        sections_pos = get_sections_pos(content) 
        get_sections_pos(content).each_with_index.collect do |pos, index|
          second_pos = if index == sections_pos.count - 1
                         -1
                       else
                         sections_pos[index + 1] -2
                       end
          {
            part: "#{part}.#{index+1}",
            description: content[pos..second_pos].strip.chop
          }
        end
      end

      def get_sections_pos(content) 
        content.enum_for(:scan, /^–.*/)
          .collect do 
            Regexp.last_match.begin(0)+1
          end
      end
    end
  end
end