require 'spec_helper'

describe MinistryDocs::Math2007Doc::ExpectationParser do
  subject(:parser) { MinistryDocs::Math2007Doc::ExpectationParser.new }

  let(:course_txt) { get_txt 'expectation_parser/course' }
  let(:specific) { get_txt 'expectation_parser/specific' }
  let(:second_specific) { get_txt 'expectation_parser/2nd_specific' }

  describe '#parse' do
    let(:parsed) { parser.parse(course_txt).first }
    let(:specific_parser) { spy }

    let(:title) { 'Representing Functions' }
    let(:description) { 'demonstrate an understanding of functions, their representations, and their inverses, and make connections between the algebraic and graphical representations of functions using transformations' }
    let(:part) { '1' }

    it 'parse title' do
      expect(parsed.title).to eq title
    end

    it 'parse description' do
      expect(parsed.description).to eq description
    end

    it 'parse part' do
      expect(parsed.part).to eq part
    end

    context 'specfifics parsing' do
      before do
        parser.specific_parser = specific_parser
        parsed
      end

      it 'parse first specific right' do
        expect(specific_parser).to have_received(:parse).with(specific, '1')
      end

      it 'parse 2nd and more specifics rights' do
        expect(specific_parser).to have_received(:parse).with(second_specific, '2')
      end
    end
  end
end
