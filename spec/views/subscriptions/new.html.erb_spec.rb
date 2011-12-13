require 'spec_helper'

describe "subscriptions/new.html.erb" do
  before(:each) do
    assign(:subscription, stub_model(Subscription,
      :service => "",
      :amount => "",
      :currency => "",
      :frequency => "",
      :offset => "",
      :days_before_notify => "",
      :started => ""
    ).as_new_record)
  end

  it "renders new subscription form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => subscriptions_path, :method => "post" do
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
