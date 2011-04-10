class ApplicationController < ActionController::Base
  protect_from_forgery
  layout 'application'
  
  helper_method :current_user
  
  rescue_from CanCan::AccessDenied do |exception|
    redirect_to root_path
  end
  
  def current_user
    User.find(session[:user_id]) unless !session[:user_id]
  end
end
