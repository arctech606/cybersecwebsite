require 'rails_helper'

RSpec.describe "publications/index", type: :view do
  before(:each) do
    assign(:publications, [
      Publication.create!(
        :name => "Name",
        :abstract => "MyText",
        :keywords => "Keywords"
      ),
      Publication.create!(
        :name => "Name",
        :abstract => "MyText",
        :keywords => "Keywords"
      )
    ])
  end

  it "renders a list of publications" do
    render
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => "Keywords".to_s, :count => 2
  end
end
