module MinistryDocs
  module BaseParser
    class SpecificParser
      def parse(content)
        parse_sections(content).collect do |section|
          OpenStruct.new(section)
        end
      end

      private

      def parse_sections(content) 
        sections = parse_paths(content)
        sections.each_with_index.collect do |path, index|
          second_pos = if index == sections.count - 1
                         -1
                       else
                         sections[index + 1][:pos][:from] - 1
                       end
          {
            path: path[:path],
            description: content[path[:pos][:to]..second_pos].strip
          }
        end
      end

      def parse_paths(content)
        content.enum_for(:scan, /^([0-9]\.[0-9])/m)
               .collect do |path|
                 {
                   path: path[0],
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
