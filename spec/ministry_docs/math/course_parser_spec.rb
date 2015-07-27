require 'spec_helper'

describe MinistryDocs::Math::CourseParser do
  let(:course_txt){get_txt 'course_parser/course'}
  subject(:course){MinistryDocs::Math::CourseParser.new(course_txt)}

  describe '#parse' do
    let(:title){'Functions'}
    let(:description){
      "This course introduces the mathematical concept of the function by extending students' experiences with linear and quadratic relations. Students will investigate properties of discrete and continuous functions, including trigonometric and exponential functions; represent functions numerically, algebraically, and graphically; solve problems involving applications of functions; investigate inverse functions; and develop facility in determining equivalent algebraic expressions. Students will reason mathematically and communicate their thinking as they solve multi-step problems."
    }
    let(:grade){'Grade 11'}
    let(:preReq){'Principles of Mathematics, Grade 10, Academic'}

    it 'parse code' do
      expect(course.parse.code).to eq  'MCR3U'
    end

    it 'parse description' do
      expect(course.parse.description).to eq description
    end

    it 'parse grade of course' do
      expect(course.parse.grade).to eq grade
    end

    it 'parse title of course' do
      expect(course.parse.title).to eq title
    end

    it 'parse preReq of course' do
      expect(course.parse.preReq).to eq preReq
    end

    it 'parse level of course'

    it 'parse creditValue of course'
  end

  def get_txt(name)
    File.read(File.dirname(__FILE__) + "/../../fixtures/math/#{name}.txt")
  end
end