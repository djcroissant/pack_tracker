class CreateClimbers < ActiveRecord::Migration
  def change
    create_table :climbers do |t|
      t.belongs_to :expedition, index: true
      t.string :name

      t.timestamps null: false
    end
  end
end
