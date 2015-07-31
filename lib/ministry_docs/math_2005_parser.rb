module MinistryDocs 
  class Math2005Parser < MathParser
    protected

    def selector
      '//*[@id="right_column"]//ul[1]/li[2]/a'
    end

    def doc_parser
      @doc_parser || Math2005Doc::DocParser.new
    end
  end
end