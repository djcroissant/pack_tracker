class InventoryItem < ActiveRecord::Base
  belongs_to :climber
  has_and_belongs_to_many :expeditions
end
