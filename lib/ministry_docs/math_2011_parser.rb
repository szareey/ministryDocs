module MinistryDocs
  class Math2011Parser
    URL = 'https://www.edu.gov.on.ca/eng/curriculum/secondary/'
    
    def parse(doc)
      DocParser.parse_course(doc)
    end

    def parse_from_site
      page = agent.get URL + 'math.html'
      file = page.search('//*[@id="right_column"]//ul[4]/li[2]/a')
                 .attribute('href').value
      parse(open(URL + file).read.encode('UTF-8', 'Windows-1251'))
    end

    private
    
    def agent
      @agent || Mechanize.new
    end
  end
end