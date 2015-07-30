require 'spec_helper'

describe MinistryDocs::Math2007Parser, :vcr do
  subject(:math_parser){ MinistryDocs::Math2007Parser.new }
  let(:full_txt) { get_txt 'math1112currb' }
  
  describe '#parse_from_site' do
    it 'get file from site' do
      expect(math_parser).to receive(:parse).with(full_txt)
      math_parser.parse_from_site
    end
  end

  it 'parse file without errors' do
    expect{math_parser.parse_from_site}.not_to raise_error
  end
end
