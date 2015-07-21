class RemoveClimberTables < ActiveRecord::Migration
  def change
    drop_table :climbers_expeditions
    drop_table :climbers  
  end
end
