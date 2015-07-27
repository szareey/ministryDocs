require 'spec_helper'

describe MinistryDocs::DocParser do
  let(:parser) { MinistryDocs::DocParser.new }
  let(:full_txt) { get_txt 'math1112currb' }
  let(:courses_section) { get_txt 'courses_section' }

  describe '#get_courses_section' do
    it 'returns course section' do
      expect(parser.get_courses_section(full_txt)).to eq courses_section
    end
  end

  def get_txt(name)
    File.read(File.dirname(__FILE__) + "/../fixtures/math/#{name}.txt")
  end
end
