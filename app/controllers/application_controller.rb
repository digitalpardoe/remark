class ApplicationController < ActionController::Base
  protect_from_forgery
  layout 'application'
  
  helper_method :current_user
  
  def current_user
    User.find(session[:user_id]) unless !session[:user_id]
  end
end
