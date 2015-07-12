class RemoveExpeditionIdFromClimber < ActiveRecord::Migration
  def change
    remove_column :climbers, :expedition_id
  end
end
