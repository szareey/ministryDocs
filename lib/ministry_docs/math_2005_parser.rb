module MinistryDocs 
  class Math2005Parser < MathParser
    protected

    def selector
      '//*[@id="right_column"]//ul[1]/li[2]/a'
    end

    def addable_info(page)
      {
        pdf_url: URL + page.search('//*[@id="right_column"]//ul[1]/li[1]/a')
                           .attribute('href').value,
        title: 'The Ontario Curriculum, Grades 9 and 10: Mathematics',
        grades: [9, 10],
        year: '2005'
      }
    end

    def doc_parser
      @doc_parser || Math2005Doc::DocParser.new
    end
  end
end