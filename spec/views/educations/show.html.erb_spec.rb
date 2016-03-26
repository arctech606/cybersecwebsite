require 'rails_helper'

RSpec.describe "educations/show", type: :view do
  before(:each) do
    @education = assign(:education, Education.create!(
      :courses_offered => "Courses Offered",
      :course_number => "Course Number",
      :semester_offered => "Semester Offered"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Courses Offered/)
    expect(rendered).to match(/Course Number/)
    expect(rendered).to match(/Semester Offered/)
  end
end
