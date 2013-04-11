class Pastor < ActiveRecord::Base
  belongs_to :user

  has_attached_file :profile_pic, :styles => { :small => "150x100>", :medium => "400x400>", :large => "800x530>" }

  scope :active, where(:active => true)
  attr_accessible :address_one, :address_two, :bio, :email,
                  :name, :phone, :profile_pic, :active, :slug, :user, :user_id
end
