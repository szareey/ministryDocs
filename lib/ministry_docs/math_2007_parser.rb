module MinistryDocs
  class Math2007Parser < MathParser
    protected

    def selector
      '//*[@id="right_column"]//ul[4]/li[2]/a'
    end

    def doc_parser
      @doc_parser || Math2007Doc::DocParser.new
    end
  end
end