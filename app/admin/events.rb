ActiveAdmin.register Event do
	 form do |f|
	 	f.inputs do
	 		f.input :user, :as => :select
	 		f.input :category, :as => :select
	 		f.input :short_description
	 		f.input :long_description
	 		f.input :city
	 		f.input :location
	 		f.input :address, :as => :string
	 		f.input :zipcode
	 		f.input :contact_email, :as => :email
	 		f.input :contact_name
	 		f.input :contact_phone, :as => :phone
	 		f.input :start_date, :as => :just_datetime_picker
	 		f.input :end_date, :as => :just_datetime_picker
	 		f.input :start_registration, :as => :just_datetime_picker
	 		f.input :end_registration, :as => :just_datetime_picker

	 		f.input :max_num_attendees
	 		f.input :min_num_attendees

	 		f.input :custom_url
	 		f.input :video_url
	 		f.input :website
	 		f.input :facebook_url
	 		f.input :twitter_id
	 		f.input :twitter_hashtag
	 		f.input :age_group, :as => :select,
	 															 :collection => Event::AGE_GROUPS

	 		f.input :shopping_limit
	 		f.input :shippings, :as => :check_boxes
	 		f.input :tag_list, :as => :select,
	 															:multiple => true,
	 															:collection => ActsAsTaggableOn::Tag.all.map(&:name)
	 	end
	 	f.buttons
	 end
end
