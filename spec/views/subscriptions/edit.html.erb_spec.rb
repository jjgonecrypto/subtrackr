require 'spec_helper'

describe "subscriptions/edit.html.erb" do
  before(:each) do
    @user = FactoryGirl.create(:user)
    @subscription = FactoryGirl.create(:subscription, user: @user)
  end

  it "renders the edit subscription form" do 
    render

    assert_select "form", :action => user_subscription_path(@user, @subscription), :method => "post" do
      assert_select "input#subscription_service", :name => "subscription[service]"
      assert_select "input#subscription_amount", :name => "subscription[amount]"
      assert_select "input#subscription_currency", :name => "subscription[currency]"
      assert_select "input#subscription_frequency", :name => "subscription[frequency]"
      assert_select "input#subscription_offset", :name => "subscription[offset]"
      assert_select "input#subscription_days_before_notify", :name => "subscription[days_before_notify]"
      assert_select "input#subscription_started", :name => "subscription[started]"
    end
  end
end
