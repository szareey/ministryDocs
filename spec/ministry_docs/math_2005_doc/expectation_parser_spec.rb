require 'spec_helper'


describe MinistryDocs::Math2005Doc::ExpectationParser do
  subject(:parser) { MinistryDocs::Math2005Doc::ExpectationParser.new }

  let(:course_txt) { get_txt 'expectation_parser/course', 'math_2005' }

  describe '#parse' do
    let(:parsed) { parser.parse(course_txt).first }
    let(:specific_parser) { spy }

    let(:title) { 'Operating with Exponents' }
    let(:description) { 'demonstrate an understanding of the exponent rules of multiplication and division, and apply them to simplify expressions' }
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

    context 'course does not have "Specific Expectations" sentence' do
      let(:course_txt) { get_txt 'expectation_parser/without_spec_expectation', 'math_2005' }
      it 'parse shorthand well' do
        expect(parsed.title).to eq 'Manipulating and Solving Algebraic Equations'
      end
    end
  end
end