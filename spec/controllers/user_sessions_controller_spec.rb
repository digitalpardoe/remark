require 'spec_helper'

describe UserSessionsController do
  before(:each) do
    @normal_role = Role.new
    @normal_role.name = 'user'
    @normal_role.human_readable = 'Website User'
    @normal_role.save!
    
    @user = User.new
    @user.username = 'test'
    @user.password = PASSWORD
    @user.password_confirmation = PASSWORD
    @user.email = 'test@example.com'
    @user.save!
  end

  describe "GET 'new'" do
    it "should be successful" do
      get 'new'
      response.should be_success
    end
  end

  describe "PUT 'create'" do
    it "should be successful" do
      put 'create', :user => { :username => @user.username, :password => PASSWORD }
      response.should redirect_to(:action => 'new')
      flash[:notice].should == "Logged in successfully."
    end
    
    it "shouldn't be successful" do
      put 'create', :user => { :username => @user.username, :password => PASSWORD[0..4] }
      response.should redirect_to(:action => 'new')
      flash[:notice].should == "Login unsuccessful."
    end
  end

  describe "GET 'destroy'" do
    it "should be successful" do
      get 'destroy'
      response.should redirect_to(:action => 'new')
      flash[:notice].should == "Logged out."
    end
  end
end
