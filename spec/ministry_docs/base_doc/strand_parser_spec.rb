require 'spec_helper'

describe MinistryDocs::BaseDoc::StrandParser do
  subject(:parser) { MinistryDocs::BaseDoc::StrandParser.new }

  let(:course_txt) { get_txt 'strat_parser/strats' }
  let(:first_strat) { get_txt 'strat_parser/first_parsed_strat' }

  describe '#parse' do
    let(:parsed) { parser.parse(course_txt).first }

    let(:title) { 'CHARACTERISTICS OF FUNCTIONS' }
    let(:path) { 'A' }
    let(:expectation_parser) { spy }

    it 'parse title of strat' do
      expect(parsed.title).to eq title
    end

    it 'parse path of strat' do
      expect(parsed.path).to eq path
    end

    it 'parse first strat content right' do
      parser.expectation_parser = expectation_parser
      parser.parse(course_txt)
      expect(expectation_parser).to have_received(:parse).with(first_strat)
    end
  end
end
