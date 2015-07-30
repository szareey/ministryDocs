module MinistryDocs
  class Base
    def parse(doc)
      doc_parser.parse_course(doc)
    end
    
    private

    def doc_parser
      @doc_parser || BaseDoc::DocParser.new
    end
    
    def agent
      @agent || Mechanize.new
    end
  end
end