require 'spec_helper'
require 'pp'
describe MinistryDocs::DocParser do
  subject(:parser) { MinistryDocs::DocParser.new }
  
  let(:full_txt) { get_txt 'math1112currb' }
  let(:courses_section) { get_txt 'courses_section' }

  describe '#parse_course' do
    let(:course_parser) { spy }

    it 'split doc to course section' do
      parser.course_parser = course_parser
      parser.parse_course(full_txt)
      expect(course_parser).to have_received(:parse).with(courses_section)
    end

    it do
      File.open("test.txt","w") do |f|
        PP.pp(parser.parse_course(full_txt),f)
      end
      pp 
    end
  end
end
