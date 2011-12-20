require "spec_helper"

describe SubscriptionsController do
  describe "routing" do

    it "routes to #index" do
      get("/users/123/subscriptions").should route_to("subscriptions#index", user_id: "123")
    end

    it "routes to #new" do
      get("/users/123/subscriptions/new").should route_to("subscriptions#new", user_id: "123")
    end

    it "routes to #show" do
      get("/users/123/subscriptions/1").should route_to("subscriptions#show", id: "1", user_id: "123")
    end

    it "routes to #edit" do
      get("/users/123/subscriptions/1/edit").should route_to("subscriptions#edit", id: "1", user_id: "123")
    end

    it "routes to #create" do
      post("/users/123/subscriptions").should route_to("subscriptions#create", user_id: "123")
    end

    it "routes to #update" do
      put("/users/123/subscriptions/1").should route_to("subscriptions#update", id: "1", user_id: "123")
    end

    it "routes to #destroy" do
      delete("/users/123/subscriptions/1").should route_to("subscriptions#destroy", id: "1", user_id: "123")
    end

  end
end
