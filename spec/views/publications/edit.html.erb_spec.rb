require 'rails_helper'

RSpec.describe "publications/edit", type: :view do
  before(:each) do
    @publication = assign(:publication, Publication.create!(
      :name => "MyString",
      :abstract => "MyText",
      :keywords => "MyString"
    ))
  end

  it "renders the edit publication form" do
    render

    assert_select "form[action=?][method=?]", publication_path(@publication), "post" do

      assert_select "input#publication_name[name=?]", "publication[name]"

      assert_select "textarea#publication_abstract[name=?]", "publication[abstract]"

      assert_select "input#publication_keywords[name=?]", "publication[keywords]"
    end
  end
end
