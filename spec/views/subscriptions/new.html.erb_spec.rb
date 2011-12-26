require 'spec_helper'

describe "subscriptions/new.html.erb" do
  before(:each) do
    @user = FactoryGirl.create(:user)
    @subscription = FactoryGirl.build(:subscription, user: @user)
  end

  it "renders new subscription form" do
    render

    assert_select "form", action: user_subscriptions_path(:user), method: "post" do
     ["service", "amount", "currency", "frequency", "offset", "days_before_notify", "started"].each do |field|
        assert_select "input#subscription_#{field}", name: "subscription[#{field}]"
      end
    end
  end
end
