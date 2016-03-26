require 'rails_helper'

RSpec.describe "educations/edit", type: :view do
  before(:each) do
    @education = assign(:education, Education.create!(
      :courses_offered => "MyString",
      :course_number => "MyString",
      :semester_offered => "MyString"
    ))
  end

  it "renders the edit education form" do
    render

    assert_select "form[action=?][method=?]", education_path(@education), "post" do

      assert_select "input#education_courses_offered[name=?]", "education[courses_offered]"

      assert_select "input#education_course_number[name=?]", "education[course_number]"

      assert_select "input#education_semester_offered[name=?]", "education[semester_offered]"
    end
  end
end
