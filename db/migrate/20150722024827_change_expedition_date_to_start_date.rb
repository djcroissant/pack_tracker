class ChangeExpeditionDateToStartDate < ActiveRecord::Migration
  def change
    remove_column :expeditions, :date, :date
    add_column :expeditions, :start_date, :date
  end
end
