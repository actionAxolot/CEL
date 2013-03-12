class ApplicationController < ActionController::Base
  protect_from_forgery

  def default_url_options
  	{ :host => "christianeventlink.com" }
  end

end
