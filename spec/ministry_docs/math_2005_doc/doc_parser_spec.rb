require 'spec_helper'
describe MinistryDocs::Math2005Doc::DocParser do
  subject(:parser) { MinistryDocs::Math2005Doc::DocParser.new }

  let(:full_txt) { get_txt 'math910curr', 'math_2005' }
  let(:courses_section) { get_txt 'courses_section', 'math_2005' }

  describe '#parse_course' do
    let(:course_parser) { spy }

    it 'split doc to course section' do
      parser.course_parser = course_parser
      parser.parse_course(full_txt)
      expect(course_parser).to have_received(:parse).with(courses_section)
    end

    it 'contains info about doc' do
      expect(parser.parse_course(full_txt)[:year]).to eq '2005'
    end
  end
end