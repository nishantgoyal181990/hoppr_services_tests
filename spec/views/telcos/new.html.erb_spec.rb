require 'spec_helper'

describe "telcos/new" do
  before(:each) do
    assign(:telco, stub_model(Telco,
      :telco => "MyString"
    ).as_new_record)
  end

  it "renders new telco form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", telcos_path, "post" do
      assert_select "input#telco_telco[name=?]", "telco[telco]"
    end
  end
end
