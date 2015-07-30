module MinistryDocs 
  class Math2005Parser < MathParser
    protected

    def selector
      '//*[@id="right_column"]//ul[1]/li[2]/a'
    end
  end
end