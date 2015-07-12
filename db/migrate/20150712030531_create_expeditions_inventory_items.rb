class CreateExpeditionsInventoryItems < ActiveRecord::Migration
  def self.up
    create_table :expeditions_inventory_items, id: false do |t|
      t.belongs_to :expedition, index: true
      t.belongs_to :inventory_item, index: true
    end
  end

  def self.down
    drop_table :expeditions_inventory_items
  end
end
