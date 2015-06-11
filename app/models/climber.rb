class Climber < ActiveRecord::Base
  belongs_to :expedition
  has_many :packed_items
end
