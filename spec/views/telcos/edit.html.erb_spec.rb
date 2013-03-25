require 'spec_helper'

describe "telcos/edit" do
  before(:each) do
    @telco = assign(:telco, stub_model(Telco,
      :telco => "MyString"
    ))
  end

  it "renders the edit telco form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", telco_path(@telco), "post" do
      assert_select "input#telco_telco[name=?]", "telco[telco]"
    end
  end
end
