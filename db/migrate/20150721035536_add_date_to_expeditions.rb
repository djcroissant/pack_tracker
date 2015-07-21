class AddDateToExpeditions < ActiveRecord::Migration
  def change
    add_column :expeditions, :date, :date
  end
end
