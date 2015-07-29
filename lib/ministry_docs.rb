require 'ministry_docs/version'
require 'ostruct'

require 'ministry_docs/doc_parser'
require 'ministry_docs/course_parser'
require 'ministry_docs/expectation_parser'
require 'ministry_docs/strat_parser'
require 'ministry_docs/specific_parser'

module MinistryDocs
  def self.parse(doc)
    MinistryDocs::DocParser.new.parse(doc)
  end
end
