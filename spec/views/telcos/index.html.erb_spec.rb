require 'spec_helper'

describe "telcos/index" do
  before(:each) do
    assign(:telcos, [
      stub_model(Telco,
        :telco => "Telco"
      ),
      stub_model(Telco,
        :telco => "Telco"
      )
    ])
  end

  it "renders a list of telcos" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Telco".to_s, :count => 2
  end
end
