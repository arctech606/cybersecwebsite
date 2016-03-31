require 'rails_helper'

RSpec.describe "events/index", type: :view do
  before(:each) do
    assign(:events, [
      Event.create!(
        :name => "Name",
        :date => "Date",
        :desc => "MyText",
        :venue => "MyText1"
      ),
      Event.create!(
        :name => "Name",
        :date => "Date",
        :desc => "MyText",
        :venue => "MyText1"
      )
    ])
  end

  it "renders a list of events" do
    render
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "Date".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => "MyText1".to_s, :count => 2
  end
end
