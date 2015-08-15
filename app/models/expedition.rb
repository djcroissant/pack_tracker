class Expedition < ActiveRecord::Base
  has_and_belongs_to_many :users
  has_and_belongs_to_many :inventory_items

  def add_user(user)
    users << user
  end
end
