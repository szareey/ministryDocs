require 'spec_helper'

describe MinistryDocs::StratParser do
  subject(:parser){MinistryDocs::StratParser.new}
  
  let(:course_txt) { get_txt 'strat_parser/strats' }
  let(:first_strat) { get_txt 'strat_parser/first_parsed_strat' }

  describe '#parse' do
    let(:title){ 'CHARACTERISTICS OF FUNCTIONS' }
    let(:path){ 'A' }
    let(:expectation_parser) { spy }

    it 'parse title of strat' do
      expect(parser.parse(course_txt)[0].title).to eq title
    end

    it 'parse path of strat' do
      expect(parser.parse(course_txt)[0].path).to eq path
    end

    it 'parse right first strat content' do
      parser.expectation_parser = expectation_parser
      parser.parse(course_txt)
      expect(expectation_parser).to have_received(:parse).with(first_strat)
    end
  end

  def get_txt(name)
    File.read(File.dirname(__FILE__) + "/../fixtures/math/#{name}.txt")
  end
end