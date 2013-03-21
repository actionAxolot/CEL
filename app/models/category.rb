class Category < ActiveRecord::Base
  has_many :event
  attr_accessible :description, :name

  def to_s
  	"#{self.name}"
  end
end
