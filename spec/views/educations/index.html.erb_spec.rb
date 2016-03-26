require 'rails_helper'

RSpec.describe "educations/index", type: :view do
  before(:each) do
    assign(:educations, [
      Education.create!(
        :courses_offered => "Courses Offered",
        :course_number => "Course Number",
        :semester_offered => "Semester Offered"
      ),
      Education.create!(
        :courses_offered => "Courses Offered",
        :course_number => "Course Number",
        :semester_offered => "Semester Offered"
      )
    ])
  end

  it "renders a list of educations" do
    render
    assert_select "tr>td", :text => "Courses Offered".to_s, :count => 2
    assert_select "tr>td", :text => "Course Number".to_s, :count => 2
    assert_select "tr>td", :text => "Semester Offered".to_s, :count => 2
  end
end
