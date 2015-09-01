module MinistryDocs 
  class SiteParser < Base
    def initialize(doc_parser)
      @doc_parser = doc_parser
    end

    def parse
      url = @doc_parser.class::TXT_URL
      @doc_parser.parse_course(
        open_doc(url)
      )
    end
  end
end