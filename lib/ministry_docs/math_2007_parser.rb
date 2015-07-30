module MinistryDocs
  class Math2007Parser < MathParser
    protected

    def selector
      '//*[@id="right_column"]//ul[4]/li[2]/a'
    end
  end
end