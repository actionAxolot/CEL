class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :validatable
  devise :database_authenticatable, :registerable,
  :recoverable, :rememberable, :trackable, :omniauthable, :omniauth_providers => [:facebook, :twitter]

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, 
  :password_confirmation, :remember_me, 
  :first_name, :last_name, :provider, :uid
  # attr_accessible :title, :body

  def self.find_for_facebook_oauth(auth, signed_in_resource=nil)
  	user = User.where(:provider => auth.provider, :uid => auth.uid).first
  	unless user
  		user = User.create(first_name:auth.extra.raw_info.first_name,
  			last_name:auth.extra.raw_info.last_name, 
  			provider:auth.provider,
  			uid:auth.uid,
  			email:auth.info.email,
  			password:Devise.friendly_token[0.20])
  	end
  	user
  end

  def self.find_for_twitter_oauth(auth, signed_in_resource=nil)
  	user = User.where(:provider => auth.provider, :uid => auth.uid).first
  	unless user
  		user = User.create(first_name:auth.extra.raw_info.name,
  			provider:auth.provider,
  			uid:auth.uid,
  			email:auth.extra.raw_info.screen_name + "@twitter.com",
  			password:Devise.friendly_token[0.20])
  	end
  	user
  end

  def self.new_with_session(params, session)
  	super.tap do |user|
  		if data = session["devise.facebook_data"] && session["devise.facebook_data"]["extra"]["raw_info"]
  			user.email = data["email"] if use.email.blank?
  		end
  	end
  end

end