require 'spec_helper'

describe MinistryDocs::ExpectationParser do
  let(:course_txt) { get_txt 'course_parser/course' }
  subject(:parser) { MinistryDocs::ExpectationParser.new }


  describe '#parse_strands' do
    it 'parse overall '
    it 'returns all availabe strands' do
      
    end
  end

  it 'parse overall spec' do
    p parser.parse_overall(course_txt)
  end

  def get_txt(name)
    File.read(File.dirname(__FILE__) + "/../fixtures/math/#{name}.txt")
  end
end
