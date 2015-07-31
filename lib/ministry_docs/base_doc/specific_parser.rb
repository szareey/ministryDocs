module MinistryDocs
  module BaseDoc
    class SpecificParser < BaseParser
      def parse(content, part)
        parse_sections(content, part).collect do |section|
          OpenStruct.new(section)
        end
      end
    end
  end
end