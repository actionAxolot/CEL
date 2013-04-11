class Pastor < ActiveRecord::Base
  scope :active, where(:active => true)
  attr_accessible :address_one, :address_two, :bio, :email,
                  :name, :phone, :profile_pic, :active, :slug
end
