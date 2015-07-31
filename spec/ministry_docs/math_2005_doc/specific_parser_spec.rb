require 'spec_helper'

describe MinistryDocs::Math2005Doc::SpecificParser do
  subject(:parser) { MinistryDocs::Math2005Doc::SpecificParser.new }

  let(:specific) { get_txt 'specific_parser/specific', 'math_2005' }

  describe '#parse' do
    let(:parsed) { parser.parse(specific, '1').first }

    let(:part) { '1.1' }
    let(:description) { "substitute into and evaluate algebraic expressions involving exponents (i.e., evaluate expressions involving natural-number exponents with rational-number bases (Sample problem: A movie theatre wants to compare the volumes of popcorn in two containers, a cube with edge length 8.1 cm and a cylinder \nwith radius 4.5 cm and height 8.0 cm. Which container holds more popcorn?)" }

    it 'parse part' do
      expect(parsed.part).to eq part
    end

    it 'parse description' do
      expect(parsed.description).to eq description
    end
  end
end
