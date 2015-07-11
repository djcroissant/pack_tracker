class AddClimberIdToInventoryItems < ActiveRecord::Migration
  def change
    add_reference :inventory_items, :climber, index: true
  end
end
