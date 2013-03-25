require "spec_helper"

describe TelcosController do
  describe "routing" do

    it "routes to #index" do
      get("/telcos").should route_to("telcos#index")
    end

    it "routes to #new" do
      get("/telcos/new").should route_to("telcos#new")
    end

    it "routes to #show" do
      get("/telcos/1").should route_to("telcos#show", :id => "1")
    end

    it "routes to #edit" do
      get("/telcos/1/edit").should route_to("telcos#edit", :id => "1")
    end

    it "routes to #create" do
      post("/telcos").should route_to("telcos#create")
    end

    it "routes to #update" do
      put("/telcos/1").should route_to("telcos#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/telcos/1").should route_to("telcos#destroy", :id => "1")
    end

  end
end
