module MinistryDocs
  class MathParser < Base
    URL = 'https://www.edu.gov.on.ca/eng/curriculum/secondary/'

    def parse_from_site
      page = agent.get URL + 'math.html'
      file = page.search(selector)
                 .attribute('href').value
      courses = parse(open(URL + file).read.encode('UTF-8', 'Windows-1251'))
      {
        courses: courses,
        subject: 'math'
      }.merge(addable_info(page))
    end

    protected

    def selector
      raise NotImplementedError
    end
  end
end