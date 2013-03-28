ActiveAdmin.register Event do
	scope :unpublished

	index	do
		column :id
		column :title
		column :short_description
		column :location
		column :state
		column :city
		column :zipcode
		column :contact_email
		column :contact_phone
		column :start_date
		column :end_date
		column :published
		default_actions
	end

	form :html => { :enctype => "multipart/form-data" } do |f|
		f.inputs do
			f.input :user, :as => :select
			f.input :category, :as => :select
			f.input :title
			f.input :short_description
			f.input :long_description, :as => :html_editor
			f.input :state, :as => :select, :collection => Event::STATES
			f.input :city
			f.input :location
			f.input :address_one, :as => :string
			f.input :address_two, :as => :string
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

			f.input :shippings, :as => :check_boxes
			f.input :tag_list, :as => :select,
																:multiple => true,
																:collection => ActsAsTaggableOn::Tag.all.map(&:name)
			f.input :cover, :as => :file, :hint => f.template.image_tag(f.object.cover.url(:small))
			f.input :published
		end
		f.buttons
	end
end
