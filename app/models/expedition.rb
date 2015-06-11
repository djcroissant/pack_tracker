class Expedition < ActiveRecord::Base
  has_many :climbers
  has_many :packed_items, through: :climbers
end
