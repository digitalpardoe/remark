class AdminController < ApplicationController
  layout 'admin'
  
  rescue_from CanCan::AccessDenied do |exception|
    flash[:error] = exception.message
    redirect_to new_user_session_path
  end
  
  def index
    raise CanCan::AccessDenied unless can? :manage, :all
  end
end
