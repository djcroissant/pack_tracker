class ChangeIndexFromClimbersToUsers < ActiveRecord::Migration
  def change
    remove_reference :inventory_items, :climber, index: true
    add_reference :inventory_items, :user, index: true
  end
end
