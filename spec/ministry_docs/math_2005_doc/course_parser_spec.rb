require 'spec_helper'

describe MinistryDocs::Math2005Doc::CourseParser do
  let(:course_txt) { get_txt 'course_parser/course', 'math_2005' }
  subject(:parser) { MinistryDocs::Math2005Doc::CourseParser.new }

  describe '#parse_courses' do
    let(:courses) { get_txt 'course_parser/courses', 'math_2005' }
    let(:first_txt) { get_txt 'course_parser/parse_courses/first', 'math_2005' }
    let(:last_txt) { get_txt 'course_parser/parse_courses/last', 'math_2005' }

    it 'return array of courses in text format' do
      course = parser.parse_courses(courses).first
      expect(course).to eq first_txt
    end

    context 'when course is last' do
      it 'return right course range' do
        last_course = parser.parse_courses(courses).last
        expect(last_course).to eq last_txt
      end
    end
  end

  describe '#parse_code' do
    it 'return code of course' do
      expect(parser.parse_code(course_txt)).to eq 'MPM1D'
    end
  end

  describe '#parse_title' do
    let(:title) { 'Principles of Mathematics' }

    it 'return title of course' do
      expect(parser.parse_title(course_txt)).to eq title
    end
  end

  describe '#parse_pre_req' do
    let(:pre_req) { '' }

    it 'return pre_req of course' do
      expect(parser.parse_pre_req(course_txt)).to eq pre_req
    end
  end

  describe '#parse_grade' do
    let(:grade) { 'Grade 9' }

    it 'return grade of course' do
      expect(parser.parse_grade(course_txt)).to eq grade
    end
  end

  describe '#parse_description' do
    let(:description) { "This course enables students to develop an understanding of mathematical concepts related to algebra, analytic geometry, and measurement and geometry through investigation, the effective use of technology, and abstract reasoning. Students will investigate relationships, which they will then generalize as equations of lines, and will determine the connections between different representations of a linear relation. They will also explore relationships that emerge from the measurement of three-dimensional figures and two-dimensional shapes. Students will reason mathematically and communicate their thinking as they solve multi-step problems." }

    it 'return description of course' do
      expect(parser.parse_description(course_txt)).to eq description
    end
  end
end
