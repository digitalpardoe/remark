class ApplicationController < ActionController::Base
  protect_from_forgery
  layout 'application'
  
  rescue_from CanCan::AccessDenied do |exception|
    flash[:error] = exception.message
    redirect_to root_path
  end
  
  helper_method :current_user
  
  def current_user
    User.find(session[:user_id]) unless !session[:user_id]
  end
end
