class CreateExpeditions < ActiveRecord::Migration
  def change
    create_table :expeditions do |t|
      t.string :title
      t.integer :days

      t.timestamps null: false
    end
  end
end
