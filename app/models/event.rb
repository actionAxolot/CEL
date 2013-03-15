class Event < ActiveRecord::Base
  belongs_to :user
  attr_accessible :address, :city, :contact_email, :contact_name, :contact_phone, :end_date, :location, :long_description, :max_amount_of_tickets, :shopping_limit, :short_description, :start_date, :zipcode
end
