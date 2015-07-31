require 'spec_helper'
describe MinistryDocs::Math2007Doc::DocParser do
  subject(:parser) { MinistryDocs::Math2007Doc::DocParser.new }
  
  let(:full_txt) { get_txt 'math1112currb' }
  let(:courses_section) { get_txt 'courses_section' }

  describe '#parse_course' do
    let(:course_parser) { spy }

    it 'split doc to course section' do
      parser.course_parser = course_parser
      parser.parse_course(full_txt)
      expect(course_parser).to have_received(:parse).with(courses_section)
    end
  end
end
