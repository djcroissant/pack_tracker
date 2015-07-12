class Climber < ActiveRecord::Base
  has_and_belongs_to_many :expeditions
  has_many :packed_items
  has_many :inventory_items
end
