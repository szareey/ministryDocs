module MinistryDocs
  class Base
    def parse(doc)
      doc_parser.parse_course(doc)
    end
    
    private

    def doc_parser
      raise NotImplementedError
    end
    
    def agent
      @agent || Mechanize.new
    end
  end
end