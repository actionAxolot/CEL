class Event < ActiveRecord::Base
  AGE_GROUPS = {
    "Everyone" => "Everyone",
    "Under 15" => "Under 15",
    "15 to 24" => "15 to 24",
    "25 to 44" => "25 to 44",
    "45 to 64" => "45 to 64",
    "65 and up" => "65 and up"
  }

	just_define_datetime_picker :start_date, :add_to_attr_accessible => true
  just_define_datetime_picker :end_date, :add_to_attr_accessible => true
  just_define_datetime_picker :start_registration, :add_to_attr_accessible => true
	just_define_datetime_picker :end_registration, :add_to_attr_accessible => true

  belongs_to :user
  belongs_to :category
  has_and_belongs_to_many :shippings, :join_table => :shippings_events
  acts_as_taggable

  validates_inclusion_of :age_group, :in => AGE_GROUPS

  attr_accessible :address, :city, :contact_email, :contact_name, 
  		:contact_phone, :location, :long_description, 
  		:max_num_attendees, :min_num_attendees, :shopping_limit, :short_description, :zipcode, :tag_list,
  		:custom_url, :video_url, :start_registration, :end_registration, :start_date, :end_date, :website, :facebook_url,
  		:twitter_id, :twitter_hashtag, :minimum_age
end