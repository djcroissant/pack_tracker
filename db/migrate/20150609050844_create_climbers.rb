class CreateClimbers < ActiveRecord::Migration
  def change
    create_table :climbers do |t|
      t.string :name

      t.timestamps null: false
    end
  end
end
