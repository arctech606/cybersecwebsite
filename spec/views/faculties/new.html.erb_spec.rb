require 'rails_helper'

RSpec.describe "faculties/new", type: :view do
  before(:each) do
    assign(:faculty, Faculty.new(
      :name => "MyString",
      :dept => "MyString",
      :desc => "MyText",
      :office =>"MyText",
      :phone_no =>"MyString",
      :email =>"MyString"
    ))
  end

  it "renders new faculty form" do
    render

    assert_select "form[action=?][method=?]", faculties_path, "post" do

      assert_select "input#faculty_name[name=?]", "faculty[name]"

      assert_select "input#faculty_dept[name=?]", "faculty[dept]"

      assert_select "textarea#faculty_desc[name=?]", "faculty[desc]"
      
      assert_select "textarea#faculty_office[name=?]","faculty[office]"
      
      assert_select "input#faculty_phone_no[name=?]","faculty[phone_no]"
      
      assert_select "input#faculty_email[name=?]","faculty[email]"
      
      
    end
  end
end
