require "rails_helper"

RSpec.describe PackedItemsController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/packed_items").to route_to("packed_items#index")
    end

    it "routes to #new" do
      expect(:get => "/packed_items/new").to route_to("packed_items#new")
    end

    it "routes to #show" do
      expect(:get => "/packed_items/1").to route_to("packed_items#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/packed_items/1/edit").to route_to("packed_items#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/packed_items").to route_to("packed_items#create")
    end

    it "routes to #update" do
      expect(:put => "/packed_items/1").to route_to("packed_items#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/packed_items/1").to route_to("packed_items#destroy", :id => "1")
    end

  end
end
