module MinistryDocs
  class Math2007Parser < MathParser
    protected

    def selector
      '//*[@id="right_column"]//ul[4]/li[2]/a'
    end

    def addable_info(page)
      {
        pdf_url: URL + page.search('//*[@id="right_column"]//ul[4]/li[1]/a')
                           .attribute('href').value,
        title: 'The Ontario Curriculum, Grades 11 and 12: Mathematics',
        grades: [11, 12],
        year: '2007'
      }
    end

    def doc_parser
      @doc_parser || Math2007Doc::DocParser.new
    end
  end
end