require 'active_support/secure_random'
require 'digest/sha1'

class User < ActiveRecord::Base
  validates_presence_of :username, :password, :password_confirmation, :email
  validates_confirmation_of :password
  validates_uniqueness_of :username, :email
  validates_length_of :password, :minimum => 6
  validates_format_of :email, :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i, :on => :create
  
  before_validation :generate_salt, :on => :create
  after_validation :encode_password, :on => :create
  
  attr_protected :crypted_password, :password_salt
  attr_accessor :password, :password_confirmation
  
  private
  def generate_salt
    self.password_salt = ActiveSupport::SecureRandom.base64(16)
  end
  
  def encode_password
    self.crypted_password = User.digest(self.password, self.password_salt)
    self.password, self.password_confirmation = nil
  end
  
  class << self
    def digest(password, salt)
      Digest::SHA1.hexdigest("--#{salt}--#{password}--")
    end
    
    def authenticate(username, password)
      user = where(:username => username).first
      where(:username => username, :crypted_password => digest(password || '', user ? user.password_salt : '')).limit(1).first
    end
  end
end
