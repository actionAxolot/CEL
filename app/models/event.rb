class Event < ActiveRecord::Base
  scope :unpublished, where(:published => true)

  STATES = [
    ['Alabama', 'AL'],
    ['Alaska', 'AK'],
    ['Arizona', 'AZ'],
    ['Arkansas', 'AR'],
    ['California', 'CA'],
    ['Colorado', 'CO'],
    ['Connecticut', 'CT'],
    ['Delaware', 'DE'],
    ['District of Columbia', 'DC'],
    ['Florida', 'FL'],
    ['Georgia', 'GA'],
    ['Hawaii', 'HI'],
    ['Idaho', 'ID'],
    ['Illinois', 'IL'],
    ['Indiana', 'IN'],
    ['Iowa', 'IA'],
    ['Kansas', 'KS'],
    ['Kentucky', 'KY'],
    ['Louisiana', 'LA'],
    ['Maine', 'ME'],
    ['Maryland', 'MD'],
    ['Massachusetts', 'MA'],
    ['Michigan', 'MI'],
    ['Minnesota', 'MN'],
    ['Mississippi', 'MS'],
    ['Missouri', 'MO'],
    ['Montana', 'MT'],
    ['Nebraska', 'NE'],
    ['Nevada', 'NV'],
    ['New Hampshire', 'NH'],
    ['New Jersey', 'NJ'],
    ['New Mexico', 'NM'],
    ['New York', 'NY'],
    ['North Carolina', 'NC'],
    ['North Dakota', 'ND'],
    ['Ohio', 'OH'],
    ['Oklahoma', 'OK'],
    ['Oregon', 'OR'],
    ['Pennsylvania', 'PA'],
    ['Puerto Rico', 'PR'],
    ['Rhode Island', 'RI'],
    ['South Carolina', 'SC'],
    ['South Dakota', 'SD'],
    ['Tennessee', 'TN'],
    ['Texas', 'TX'],
    ['Utah', 'UT'],
    ['Vermont', 'VT'],
    ['Virginia', 'VA'],
    ['Washington', 'WA'],
    ['West Virginia', 'WV'],
    ['Wisconsin', 'WI'],
    ['Wyoming', 'WY']
  ]

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

  has_attached_file :cover, :styles => { :small => "150x100>", :medium => "400x400>", :large => "800x530>" }

  attr_accessible :address_one, :address_two, :state, :city, :contact_email, :contact_name,
  :contact_phone, :location, :long_description,
  :max_num_attendees, :min_num_attendees, :short_description,
  :zipcode, :tag_list, :custom_url, :video_url, :start_registration, :end_registration,
  :start_date, :end_date, :website, :facebook_url, :twitter_id, :twitter_hashtag,
  :minimum_age, :user, :user_id, :category_id, :shipping_ids, :age_group, :published, :cover, :title

  def self.search_for(params, current_user)
    events = Event.where{}
    if params[:short_description_or_name].present?
      events = events.joins(:user).where{
        (user.first_name =~ "%#{my{params[:short_description_or_name]}}%") | (user.last_name =~ "%#{my{params[:short_description_or_name]}}%") | (short_description =~ "%#{my{params[:short_description_or_name]}}%")
      }
    end

    if params[:category_id].present?
      events = events.joins(:category).where{
        (category.id = my{params[:category_id]})
      }
    end

    if params[:tags].present?
      events = events.tagged_with(params[:tags].split(","))
    end

    if params[:city].present?
      events = events.where{
        (city =~ "%#{my{params[:city]}}%")
      }
    end

    if params[:locale].present?
      events = events.where{
        (locale =~ "#{my{params[:locale]}}")
      }
    end

    if params[:zipcode].present?
      events = events.where{
        (zipcode = my{params[:zipcode]})
      }
    end

    if params[:start_date_from].present? and params[:start_date_to].present?
      from_date = DateTime.parse(params[:start_date_from])
      to_date = DateTime.parse(params[:start_date_to])
      events = events.find(:all, :conditions => { :start_date => from_date..to_date })
    elsif params[:start_date_from].present?
      from_date = DateTime.parse(params[:start_date_from])
      events = events.find(:all, :conditions => { :start_date => from_date })
    end

    if params[:mine].present? and current_user
      events = events.find(:all, :conditions => { :user_id => current_user.id })
    end

    events
  end
end
