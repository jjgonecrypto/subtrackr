require 'spec_helper'

describe "subscriptions/index.html.erb" do
  before(:each) do
    assign(:user, stub_model(User))
    assign(:subscriptions, [
      @s1 = stub_model(Subscription,
        :service => "service",
        :amount => 5,
        :currency => "usd",
        :frequency => "monthly",
        :offset => 12,
        :days_before_notify => 4,
        :started => "2001-01-01",
        :user => @user
      ),
      @s2 = stub_model(Subscription,
        :service => "service",
        :amount => 22,
        :currency => "usd",
        :frequency => "yearly",
        :offset => 3,
        :days_before_notify => 4,
        :started => "2001-01-01",
        :user => @user
      )
    ])
  end

  it "renders a list of subscriptions" do
    render
    assert_select "tr>td", :text => @s1.service, :count => 2
    assert_select "tr>td", :text => @s1.frequency, :count => 1
    assert_select "tr>td", :text => @s2.frequency, :count => 1
    assert_select "tr>td", :text => number_to_currency(@s1.amount), :count => 1
    assert_select "tr>td", :text => number_to_currency(@s2.amount), :count => 1
    assert_select "tr>td", :text => @s1.currency, :count => 2
    assert_select "tr>td", :text => @s1.offset, :count => 1
    assert_select "tr>td", :text => @s2.offset, :count => 1
    assert_select "tr>td", :text => @s1.started, :count => 2
    assert_select "tr>td", :text => @s1.days_before_notify, :count => 2
  end
end
