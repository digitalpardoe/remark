class User < ActiveRecord::Base
  validates_presence_of :username, :password, :password_confirmation, :email, :name
  validates_confirmation_of :password
  validates_uniqueness_of :username, :email
  validates_length_of :password, :minimum => 6
  validates_format_of :email, :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i, :on => :create
  
  before_create
end
