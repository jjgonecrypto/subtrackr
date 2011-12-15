require 'spec_helper'

describe "subscriptions/show.html.erb" do
  before(:each) do
    @user = assign(:user, stub_model(User))
    @subscription = assign(:subscription, stub_model(Subscription,
      :service => "",
      :amount => "",
      :currency => "",
      :frequency => "",
      :offset => "",
      :days_before_notify => "",
      :started => "",
      :user => @user
    ))
  end

  it "renders attributes in <p>" do
    render
    rendered.should match(//)
    rendered.should match(//)
    rendered.should match(//)
    rendered.should match(//)
    rendered.should match(//)
    rendered.should match(//)
    rendered.should match(//)
  end
end
