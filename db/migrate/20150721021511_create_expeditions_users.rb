class CreateExpeditionsUsers < ActiveRecord::Migration
  def self.up
    create_table :expeditions_users, id: false do |t|
      t.belongs_to :expedition, index: true
      t.belongs_to :user, index: true
    end
  end

  def self.down
    drop_table :expeditions_users
  end
end
