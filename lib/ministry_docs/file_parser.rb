module MinistryDocs 
  class FileParser < Base
    def initialize(doc_parser, path)
      @doc_parser = doc_parser
      @path = path
    end

    def parse
      @doc_parser.parse_course(
        open_doc(@path)
      )
    end
  end
end