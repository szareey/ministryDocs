require 'spec_helper'

describe MinistryDocs::Math2005Parser, :vcr do
  subject(:math_parser){ MinistryDocs::Math2005Parser.new }

  it 'parse file without errors' do
    expect{math_parser.parse_from_site}.not_to raise_error
  end
end