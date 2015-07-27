module MinistryDocs
  class DocParser
    def get_courses_section(text)
      text.split(/^COURSES  $/)[1]
    end
  end
end
