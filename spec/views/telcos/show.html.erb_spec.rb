require 'spec_helper'

describe "telcos/show" do
  before(:each) do
    @telco = assign(:telco, stub_model(Telco,
      :telco => "Telco"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Telco/)
  end
end
