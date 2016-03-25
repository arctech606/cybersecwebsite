require 'rails_helper'

RSpec.describe "faculties/new", type: :view do
  before(:each) do
    assign(:faculty, Faculty.new(
      :name => "MyString",
      :dept => "MyString",
      :desc => "MyText"
    ))
  end

  it "renders new faculty form" do
    render

    assert_select "form[action=?][method=?]", faculties_path, "post" do

      assert_select "input#faculty_name[name=?]", "faculty[name]"

      assert_select "input#faculty_dept[name=?]", "faculty[dept]"

      assert_select "textarea#faculty_desc[name=?]", "faculty[desc]"
    end
  end
end
