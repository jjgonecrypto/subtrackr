require 'spec_helper'

describe "schemes/index.html.erb" do
  before(:each) do
    assign(:schemes, [
      stub_model(Scheme,
        :name => "",
        :amount => 2.95,
        :currency => "",
        :frequency => ""
      ),
      stub_model(Scheme,
        :name => "",
        :amount => 2,
        :currency => "",
        :frequency => ""
      )
    ])
  end

  it "renders a list of schemes" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "".to_s, :count => 6
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "$2.95", :count => 1
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "$2.00", :count => 1
  end
end
