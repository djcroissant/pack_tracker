class CreateInventoryItems < ActiveRecord::Migration
  def change
    create_table :inventory_items do |t|
      t.string :title
      t.text :description
      t.integer :weight
      t.boolean :group_item

      t.timestamps null: false
    end
  end
end
