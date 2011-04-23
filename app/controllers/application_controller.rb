class ApplicationController < ActionController::Base
  protect_from_forgery
  layout 'application'
  
  helper_method :current_user, :feedburner_url
  
  rescue_from CanCan::AccessDenied do |exception|
    redirect_to root_path
  end
  
  def current_user
    User.find(session[:user_id]) unless !session[:user_id]
  end
  
  def feedburner_url
    "http://feeds2.feedburner.com/#{Setting.application.value(:feedburner_stub)}"
  end
end
