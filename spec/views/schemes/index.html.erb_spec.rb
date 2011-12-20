require 'spec_helper'

describe "schemes/index.html.erb" do
  before(:each) do
    assign(:schemes, [
      @s1 = stub_model(Scheme,
        :name => "scheme",
        :amount => 2.95,
        :currency => "usd",
        :frequency => "monthly"
      ),
      @s2 = stub_model(Scheme,
        :name => "scheme",
        :amount => 2,
        :currency => "usd",
        :frequency => "monthly"
      )
    ])
  end

  it "renders a list of schemes" do
    render
    assert_select "tr>td", :text => @s1.name, :count => 2
    assert_select "tr>td", :text => @s1.currency, :count => 2
    assert_select "tr>td", :text => @s1.frequency, :count => 2
    assert_select "tr>td", :text => number_to_currency(@s1.amount), :count => 1
    assert_select "tr>td", :text => number_to_currency(@s2.amount), :count => 1
  end
end
