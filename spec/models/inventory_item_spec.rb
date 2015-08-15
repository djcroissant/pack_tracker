require 'spec_helper'
require 'rails_helper'

describe InventoryItem, type: :model do
  let(:inventory_item) { create(:inventory_item) }
  let(:expedition) { create(:expedition) }

  context "#add_expedition" do
    it "adds an association between the inventory item and the expedition" do
      expect { inventory_item.add_expedition(expedition) }
      .to change(inventory_item.expeditions, :count).by(1)
    end
  end
end
