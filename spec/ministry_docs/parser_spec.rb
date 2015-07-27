require 'spec_helper'

describe MinistryDocs::Parser do
  let(:parser) {MinistryDocs::Parser.new}
  let(:full_txt) {get_txt 'math1112currb'}
  let(:courses_section) {get_txt 'courses_section'}

  describe '#getCoursesSection' do
    it 'returns courser section' do
      expect(parser.getCoursesSection(full_txt)).to eq courses_section
    end
  end

  describe '#getCoursesRange' do
    let(:first_txt){get_txt 'parser/getCoursesRange/first'}
    let(:last_txt){get_txt 'parser/getCoursesRange/last'}

    it 'return char position range of courses' do
      intervals = parser.getCoursesRange(courses_section)
      expect(courses_section[intervals.first]).to eq first_txt
    end

    context 'when course is last' do
      it 'return right course range' do
        intervals = parser.getCoursesRange(courses_section)
        expect(courses_section[intervals.last]).to eq last_txt
      end
    end
  end

  def get_txt(name)
    File.read(File.dirname(__FILE__) + "/../fixtures/math/#{name}.txt")
  end
end
