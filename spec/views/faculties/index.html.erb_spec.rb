require 'rails_helper'

RSpec.describe "faculties/index", type: :view do
  before(:each) do
    assign(:faculties, [
      Faculty.create!(
        :name => "Name",
        :dept => "Dept",
        :desc => "MyText",
        :office => "MyText1",
        :phone_no => "Phone_no",
        :email => "Email"
        
      ),
      Faculty.create!(
        :name => "Name",
        :dept => "Dept",
        :desc => "MyText",
        :office => "MyText1",
        :phone_no => "Phone_no",
        :email => "Email"
        
      )
    ])
  end

  it "renders a list of faculties" do
    render
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "Dept".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => "MyText1".to_s, :count => 2
    assert_select "tr>td", :text => "Phone_no".to_s, :count => 2
    assert_select "tr>td", :text => "Email".to_s, :count => 2
    
  end
end
