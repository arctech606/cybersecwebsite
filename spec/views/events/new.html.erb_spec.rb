require 'rails_helper'

RSpec.describe "events/new", type: :view do
  before(:each) do
    assign(:event, Event.new(
      :name => "MyString",
      :date => "MyString",
      :desc => "MyText",
      :venue => "MyText"
    ))
  end

  it "renders new event form" do
    render

    assert_select "form[action=?][method=?]", events_path, "post" do

      assert_select "input#event_name[name=?]", "event[name]"

      assert_select "input#event_date[name=?]", "event[date]"

      assert_select "textarea#event_desc[name=?]", "event[desc]"

      assert_select "textarea#event_venue[name=?]", "event[venue]"
    end
  end
end
