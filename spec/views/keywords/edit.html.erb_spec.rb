require 'spec_helper'

describe "keywords/edit" do
  before(:each) do
    @keyword = assign(:keyword, stub_model(Keyword,
      :keyword => "MyString"
    ))
  end

  it "renders the edit keyword form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", keyword_path(@keyword), "post" do
      assert_select "input#keyword_keyword[name=?]", "keyword[keyword]"
    end
  end
end
