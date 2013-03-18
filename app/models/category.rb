class Category < ActiveRecord::Base
  has_many :event
  attr_accessible :description, :name
end
