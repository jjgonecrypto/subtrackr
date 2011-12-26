require 'spec_helper'

describe "subscriptions/edit.html.erb" do
  before(:each) do
    @user = FactoryGirl.create(:user)
    @subscription = FactoryGirl.create(:subscription, user: @user)
  end

  it "renders the edit subscription form" do 
    render

    assert_select "form", action: user_subscription_path(@user, @subscription), method: "post" do

      ["service", "amount", "currency", "frequency", "offset", "days_before_notify", "started"].each do |field|
        assert_select "input#subscription_#{field}", name: "subscription[#{field}]", value: @subscription.send(field)
      end
    end
  end
end
