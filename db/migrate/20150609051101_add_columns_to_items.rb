class AddColumnsToItems < ActiveRecord::Migration
  def change
    add_column :items, :weight, :integer
    add_column :items, :group_item, :boolean
  end
end
