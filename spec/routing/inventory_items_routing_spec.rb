require "rails_helper"

RSpec.describe InventoryItemsController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/inventory_items").to route_to("inventory_items#index")
    end

    it "routes to #new" do
      expect(:get => "/inventory_items/new").to route_to("inventory_items#new")
    end

    it "routes to #show" do
      expect(:get => "/inventory_items/1").to route_to("inventory_items#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/inventory_items/1/edit").to route_to("inventory_items#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/inventory_items").to route_to("inventory_items#create")
    end

    it "routes to #update" do
      expect(:put => "/inventory_items/1").to route_to("inventory_items#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/inventory_items/1").to route_to("inventory_items#destroy", :id => "1")
    end

  end
end
