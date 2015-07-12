class RemoveGroupItemColumnFromInventoryItems < ActiveRecord::Migration
  def change
    remove_column :inventory_items, :group_item
  end
end
