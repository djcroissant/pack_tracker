class User < ActiveRecord::Base
  has_secure_password

  validates_uniqueness_of :email

  has_and_belongs_to_many :expeditions
  has_many :inventory_items

end
