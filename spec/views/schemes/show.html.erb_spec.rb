require 'spec_helper'

describe "schemes/show.html.erb" do
  before(:each) do
    @scheme = assign(:scheme, stub_model(Scheme,
      :name => "",
      :amount => "",
      :currency => "",
      :frequency => ""
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(//)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(//)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(//)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(//)
  end
end
