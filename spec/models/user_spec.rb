require 'spec_helper'

describe User do
  PASSWORD = 'testing'
  
  before(:each) do
    @user = User.new
    @user.username = 'test'
    @user.password = PASSWORD
    @user.password_confirmation = 'testing'
    @user.email = 'test@example.com'
    @user.name = 'Test User'
  end
  
  it "generates a password salt" do
    lambda { @user.save! }.should_not raise_error(ActiveRecord::RecordInvalid)
    @user.password_salt.should_not be nil
  end
  
  it "encrypts the password" do
    lambda { @user.save! }.should_not raise_error(ActiveRecord::RecordInvalid)
    @user.crypted_password.should_not be nil
    @user.crypted_password.should_not == PASSWORD
  end
end
