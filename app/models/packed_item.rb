class PackedItem < ActiveRecord::Base
  belongs_to :expedition
  belongs_to :climber
end
