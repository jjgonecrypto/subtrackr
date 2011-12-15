require "spec_helper"

describe SchemesController do
  describe "routing" do

    it "routes to #index" do
      get("/schemes").should route_to("schemes#index")
    end

    it "routes to #new" do
      get("/schemes/new").should route_to("schemes#new")
    end

    it "routes to #show" do
      get("/schemes/1").should route_to("schemes#show", :id => "1")
    end

    it "routes to #edit" do
      get("/schemes/1/edit").should route_to("schemes#edit", :id => "1")
    end

    it "routes to #create" do
      post("/schemes").should route_to("schemes#create")
    end

    it "routes to #update" do
      put("/schemes/1").should route_to("schemes#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/schemes/1").should route_to("schemes#destroy", :id => "1")
    end

  end
end
