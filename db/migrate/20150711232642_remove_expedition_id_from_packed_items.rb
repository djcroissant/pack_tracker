class RemoveExpeditionIdFromPackedItems < ActiveRecord::Migration
  def change
    remove_column :packed_items, :expedition_id
  end
end
