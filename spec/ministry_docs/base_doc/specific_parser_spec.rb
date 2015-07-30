require 'spec_helper'

describe MinistryDocs::BaseDoc::SpecificParser do
  subject(:parser) { MinistryDocs::BaseDoc::SpecificParser.new }

  let(:specific) { get_txt 'specific_parser/specific' }

  describe '#parse' do
    let(:parsed) { parser.parse(specific).first }

    let(:path) { '1.1' }
    let(:description) { "explain the meaning of the term function, and distinguish a function from a relation that is not a function, through investigation of linear and quadratic relations using a variety of representations (i.e., tables of values, mapping diagrams, graphs, function machines, equations) and strategies (e.g., identifying a one-to-one or many-to-one mapping; using the vertical-line test) \nSample problem: Investigate, using numeric and graphical representations, whether the relation x = y2 is a function, and justify your reasoning." }

    it 'parse path' do
      expect(parsed.path).to eq path
    end

    it 'parse description' do
      expect(parsed.description).to eq description
    end
  end
end
