module MinistryDocs
  class ExpectationParser

    def parse(strat)
    end

    def parse_overall(course)
      from = course.index('OVERALL EXPECTATIONS')
      to = course.index('SPECIFIC EXPECTATIONS')
      list = course[from..to].scan(/^[0-9]\.(.*)$/)
      list.collect{|expect| expect[0].strip.chop!}
    end

    def parse_paragraphs(cours)

    end
  end
end
