class ApplicationController < ActionController::Base
  protect_from_forgery
  layout 'application'

  helper_method :current_user, :feedburner_url, :human_name, :setting

  before_filter :set_timezone

  rescue_from CanCan::AccessDenied do |exception|
    redirect_to root_path
  end

  def current_user
    User.find(session[:user_id]) unless !session[:user_id]
  end

  def feedburner_url
    "http://feeds2.feedburner.com/#{setting(:feedburner_stub)}"
  end

  def human_name
    controller_name
  end

  def setting(key)
    Rails.cache.fetch("setting_#{key.to_s}") { Setting.application.value(key) }
  end

  private
  def set_timezone
    Time.zone = setting(:time_zone)
  end
end
