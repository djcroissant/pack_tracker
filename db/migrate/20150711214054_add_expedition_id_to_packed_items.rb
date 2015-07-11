class AddExpeditionIdToPackedItems < ActiveRecord::Migration
  def change
    add_reference :packed_items, :expedition, index: true
  end
end
