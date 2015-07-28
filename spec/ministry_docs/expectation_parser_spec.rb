require 'spec_helper'

describe MinistryDocs::ExpectationParser do
  subject(:parser) { MinistryDocs::ExpectationParser.new }

  let(:course_txt) { get_txt 'expectation_parser/course' }
  let(:overall) { get_txt 'expectation_parser/overall' }
  let(:specific) { get_txt 'expectation_parser/specific' }
  
  describe '#parse' do
    it 'parse overall' do
      p parser.parse(course_txt)
    end
  end

  def get_txt(name)
    File.read(File.dirname(__FILE__) + "/../fixtures/math/#{name}.txt")
  end
end
