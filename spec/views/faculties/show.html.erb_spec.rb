require 'rails_helper'

RSpec.describe "faculties/show", type: :view do
  before(:each) do
    @faculty = assign(:faculty, Faculty.create!(
      :name => "Name",
      :dept => "Dept",
      :desc => "MyText",
      :office => "MyText1",
      :phone_no => "Phone_no",
      :email => "Email"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/Dept/)
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(/MyText1/)
    expect(rendered).to match(/Phone_no/)
    expect(rendered).to match(/Email/)
    
  end
end
