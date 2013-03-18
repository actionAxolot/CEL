class Event < ActiveRecord::Base
	just_define_datetime_picker :start_date, :add_to_attr_accessible => true
	just_define_datetime_picker :end_date, :add_to_attr_accessible => true
	just_define_datetime_picker :begin_sale, :add_to_attr_accessible => true
  belongs_to :user
  belongs_to :category
  has_and_belongs_to_many :shippings, :join_table => :shippings_events
  acts_as_taggable
  attr_accessible :address, :city, :contact_email, :contact_name, 
  		:contact_phone, :location, :long_description, 
  		:max_amount_of_tickets, :shopping_limit, :short_description, :zipcode, :tag_list,
  		:custom_url, :video_url, :begin_sale, :start_date, :end_date, :website, :facebook_url,
  		:twitter_id, :twitter_hashtag, :minimum_age
end