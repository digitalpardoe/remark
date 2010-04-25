require 'spec_helper'

describe User do
  PASSWORD = 'testing'
  
  before(:each) do
    @admin_role = Role.new
    @admin_role.name = 'admin'
    @admin_role.human_readable = 'Administrator'
    @admin_role.save!
    
    @user_role = Role.new
    @user_role.name = 'user'
    @user_role.human_readable = 'Website User'
    @user_role.save!
    
    @user = User.new
    @user.username = 'test'
    @user.password = PASSWORD
    @user.password_confirmation = PASSWORD
    @user.email = 'test@example.com'
    
    @other_user = User.new
    @other_user.username = @user.username
    @other_user.password = @user.password
    @other_user.password_confirmation = @user.password_confirmation
    @other_user.email = @user.email
  end
  
  it "stores a valid user" do
    lambda { @user.save! }.should_not raise_error
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
  
  it "resets the password and confirmation after save" do
    @user.save!
    @user.password.should be nil
    @user.password_confirmation.should be nil
  end
  
  describe "relationship" do
    describe "role" do
      it "sets the default role to be a user" do
        @user.save!
        @user.role.should == @user_role
      end
      
      it "lets me change the user role" do
        @user.save!
        @user.role = @admin_role
        @user.save!
        @user.role.should == @admin_role
      end
      
      it "returns true if the user as a role" do
        @user.save!
        @user.role?(:user).should be true
      end
      
      it "returns false if the user doesn't have a role" do
        @user.save!
        @user.role?(:admin).should be false
      end
    end
  end
  
  describe "updating:" do
    it "shouldn't update the password when it is blank" do
      NEW_USERNAME = 'testing'
      
      @user.save!
      crypted_password = @user.crypted_password
      @user.update_attributes!(:username => NEW_USERNAME, :password => '', :password_confirmation => '', :email => 'test@test.com')
      
      @user.crypted_password.should == crypted_password
      @user.username.should == NEW_USERNAME
    end
    
    it "should still validate password length when something is present" do
      @user.save!
      lambda { @user.update_attributes!(:username => @user.username, :password => 'test', :password_confirmation => 'test', :email => @user.email) }.should raise_error(ActiveRecord::RecordInvalid)
    end
    
    it "should still check confirmation when something is present" do
      @user.save!
      lambda { @user.update_attributes!(:username => @user.username, :password => 'testing', :password_confirmation => '', :email => @user.email) }.should raise_error(ActiveRecord::RecordInvalid)
    end
  end
  
  describe "authentication:" do
    it "should return a single user record with valid details" do
      @user.save!
      authenticated_user = User.authenticate(@user.username, PASSWORD)
      %w{username email}.each do |property|
        eval "authenticated_user.#{property}.should == @user.#{property}"
      end
    end
    
    it "should not return any user due to invalid password" do
      @user.save!
      User.authenticate(@user.username, PASSWORD[0..4]).should be nil
    end
    
    it "should not return any user due to invalid username" do
      @user.save!
      User.authenticate(@user.username[0..2], PASSWORD).should be nil
    end
    
    it "shouldn't fail because username is missing" do
      @user.save!
      lambda { User.authenticate(nil, PASSWORD) }.should_not raise_error 
    end
    
    it "shouldn't fail because password is missing" do
      @user.save!
      lambda { User.authenticate(@user.username, nil) }.should_not raise_error 
    end
    
    it "shouldn't fail because everything is missing" do
      @user.save!
      lambda { User.authenticate(nil, nil) }.should_not raise_error 
    end
  end
  
  describe "validations:" do
    it "shouldn't validate due to missing username" do
      @user.username = nil
      lambda { @user.save! }.should raise_error(ActiveRecord::RecordInvalid)
    end
  
    it "shouldn't validate due to missing password" do
      @user.password = nil
      lambda { @user.save! }.should raise_error(ActiveRecord::RecordInvalid)
    end
  
    it "shouldn't validate due to missing password_confirmation" do
      @user.password_confirmation = nil
      lambda { @user.save! }.should raise_error(ActiveRecord::RecordInvalid)
    end
  
    it "shouldn't validate due to missing email" do
      @user.email = nil
      lambda { @user.save! }.should raise_error(ActiveRecord::RecordInvalid)
    end

    it "shouldn't validate due to incorrect password confirmation" do
      @user.password_confirmation = "#{PASSWORD}-#{PASSWORD}"
      lambda { @user.save! }.should raise_error(ActiveRecord::RecordInvalid)
    end
    
    it "shouldn't validate due to short password" do
      @user.password = PASSWORD[0..4]
      @user.password_confirmation = PASSWORD[0..4]
      lambda { @user.save! }.should raise_error(ActiveRecord::RecordInvalid)
    end
    
    it "shouldn't validate due to invalid email address" do
      @user.email = 'test.com'
      lambda { @user.save! }.should raise_error(ActiveRecord::RecordInvalid)
    end
    
    it "shouldn't validate due to duplicate entry of username" do
      @user.save!
      @other_user.email = 'something_different@example.com'
      lambda { @other_user.save! }.should raise_error(ActiveRecord::RecordInvalid)
    end
    
    it "shouldn't validate due to duplicate entry of email address" do
      @user.save!
      @other_user.username = 'something_different'
      lambda { @other_user.save! }.should raise_error(ActiveRecord::RecordInvalid)
    end
    
    it "shouldn't validate due to missing role" do
      @user.save!
      @user.role = nil
      lambda { @user.save! }.should raise_error(ActiveRecord::RecordInvalid)
    end
  end
end
