require 'ministry_docs/version'
require 'ostruct'

require 'ministry_docs/base_doc/base_parser'
['base', 'math_2007', 'math_2005'].each do |type|
  [
    'doc_parser', 
    'course_parser', 
    'expectation_parser', 
    'strand_parser',
    'specific_parser'
  ].each do |parser|
    file = "ministry_docs/#{type}_doc/#{parser}.rb"
    begin
      require file
    rescue LoadError

    end
  end
end

require 'ministry_docs/base'

require 'ministry_docs/math_parser'
require 'ministry_docs/math_2005_parser'
require 'ministry_docs/math_2007_parser'

require 'mechanize'
require 'open-uri'

module MinistryDocs
end
