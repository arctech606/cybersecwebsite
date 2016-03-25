require 'rails_helper'

RSpec.describe "events/show", type: :view do
  before(:each) do
    @event = assign(:event, Event.create!(
      :name => "Name",
      :date => "Date",
      :desc => "MyText",
      :venue => "MyText"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/Date/)
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(/MyText/)
  end
end
