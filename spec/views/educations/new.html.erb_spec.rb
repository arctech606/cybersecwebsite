require 'rails_helper'

RSpec.describe "educations/new", type: :view do
  before(:each) do
    assign(:education, Education.new(
      :courses_offered => "MyString",
      :course_number => "MyString",
      :semester_offered => "MyString"
    ))
  end

  it "renders new education form" do
    render

    assert_select "form[action=?][method=?]", educations_path, "post" do

      assert_select "input#education_courses_offered[name=?]", "education[courses_offered]"

      assert_select "input#education_course_number[name=?]", "education[course_number]"

      assert_select "input#education_semester_offered[name=?]", "education[semester_offered]"
    end
  end
end
