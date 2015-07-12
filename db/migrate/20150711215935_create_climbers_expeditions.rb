class CreateClimbersExpeditions < ActiveRecord::Migration
  def self.up
    create_table :climbers_expeditions, id: false do |t|
      t.belongs_to :climber, index: true
      t.belongs_to :expedition, index: true
    end
  end

  def self.down
    drop_table :climbers_expeditions
  end
end
