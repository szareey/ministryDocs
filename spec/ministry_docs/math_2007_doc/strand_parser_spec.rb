require 'spec_helper'

describe MinistryDocs::Math2007Doc::StrandParser do
  subject(:parser) { MinistryDocs::Math2007Doc::StrandParser.new }

  let(:course_txt) { get_txt 'strat_parser/strats' }
  let(:first_strat) { get_txt 'strat_parser/first_parsed_strat' }

  describe '#parse' do
    let(:parsed) { parser.parse(course_txt).first }

    let(:title) { 'CHARACTERISTICS OF FUNCTIONS' }
    let(:part) { 'A' }
    let(:expectation_parser) { spy }

    it 'parse title of strat' do
      expect(parsed.title).to eq title
    end

    it 'parse part of strat' do
      expect(parsed.part).to eq part
    end

    it 'parse first strat content right' do
      parser.expectation_parser = expectation_parser
      parser.parse(course_txt)
      expect(expectation_parser).to have_received(:parse).with(first_strat)
    end
  end
end
