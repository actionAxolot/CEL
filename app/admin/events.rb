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
	 		f.input :max_amount_of_tickets

	 		f.input :custom_url
	 		f.input :video_url
	 		f.input :begin_sale, :as => :just_datetime_picker
	 		f.input :website
	 		f.input :facebook_url
	 		f.input :twitter_id
	 		f.input :twitter_hashtag
	 		f.input :minimum_age

	 		f.input :shopping_limit
	 		f.input :shippings, :as => :check_boxes
	 		f.input :tag_list, :as => :select,
	 															:multiple => true,
	 															:collection => ActsAsTaggableOn::Tag.all.map(&:name)
	 	end
	 	f.buttons
	 end
end
