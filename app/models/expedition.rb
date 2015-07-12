class Expedition < ActiveRecord::Base
  has_and_belongs_to_many :climbers
  has_and_belongs_to_many :packed_items
end
