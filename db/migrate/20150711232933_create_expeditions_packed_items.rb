class CreateExpeditionsPackedItems < ActiveRecord::Migration
  def self.up
    create_table :expeditions_packed_items, id: false do |t|
      t.belongs_to :expedition, index: true
      t.belongs_to :packed_item, index: true
    end
  end
  
  def self.down
    drop_table :expeditions_packed_items
  end
end
