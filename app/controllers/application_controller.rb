class ApplicationController < ActionController::Base
  protect_from_forgery

  def authenticate_admin_user!
    raise SecurityError unless current_user.try(:is_admin) == true
  end

  def check_privileges!
    redirect_to new_user_registration_path, error: "You have to be logged in to create a new event" unless current_user
  end

  rescue_from SecurityError do |exception|
    redirect_to root_path
  end
end
