require 'spec_helper'

describe MinistryDocs::CourseParser do
  let(:course_txt) { get_txt 'course_parser/course' }
  subject(:parser) { MinistryDocs::CourseParser.new }

  describe '#parse_courses' do
    let(:courses_section) { get_txt 'courses_section' }

    let(:first_txt) { get_txt 'course_parser/parse_courses/first' }
    let(:last_txt) { get_txt 'course_parser/parse_courses/last' }

    it 'return array of courses in text format' do
      course = parser.parse_courses(courses_section).first
      expect(course).to eq first_txt
    end

    context 'when course is last' do
      it 'return right course range' do
        last_course = parser.parse_courses(courses_section).last
        expect(last_course).to eq last_txt
      end
    end
  end

  describe '#parse_code' do
    it 'return code of course' do
      expect(parser.parse_code(course_txt)).to eq 'MCR3U'
    end
  end

  describe '#parse_title' do
    let(:title) { 'Functions' }

    it 'return title of course' do
      expect(parser.parse_title(course_txt)).to eq title
    end
  end

  describe '#parse_pre_req' do
    let(:pre_req) { 'Principles of Mathematics, Grade 10, Academic' }
    
    it 'return pre_req of course' do
      expect(parser.parse_pre_req(course_txt)).to eq pre_req
    end
  end

  describe '#parse_grade' do
    let(:grade) { 'Grade 11' }
    
    it 'return grade of course' do
      expect(parser.parse_grade(course_txt)).to eq grade
    end
  end

  describe '#parse_description' do
    let(:description){ "This course introduces the mathematical concept of the function by extending students' experiences with linear and quadratic relations. Students will investigate properties of discrete and continuous functions, including trigonometric and exponential functions; represent functions numerically, algebraically, and graphically; solve problems involving applications of functions; investigate inverse functions; and develop facility in determining equivalent algebraic expressions. Students will reason mathematically and communicate their thinking as they solve multi-step problems." }
    
    it 'return description of course' do
      expect(parser.parse_description(course_txt)).to eq description
    end
  end

  def get_txt(name)
    File.read(File.dirname(__FILE__) + "/../fixtures/math/#{name}.txt")
  end
end
