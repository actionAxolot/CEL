class Shipping < ActiveRecord::Base
	has_and_belongs_to_many :events, :join_table => :shippings_events
  attr_accessible :name, :short_description
end
