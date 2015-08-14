class InventoryItem < ActiveRecord::Base
  belongs_to :user
  has_and_belongs_to_many :expeditions

  def add_expedition(expedition)
    expeditions << expedition
  end
end
