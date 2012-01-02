require 'spec_helper'

describe "Subscriptions" do
  describe "GET /users/123/subscriptions" do
    it "works! (now write some real specs)" do
      # Run the generator again with the --webrat flag if you want to use webrat methods/matchers
      get user_subscriptions_path(FactoryGirl.create(:user))
      response.status.should be(200)
    end
  end
end
