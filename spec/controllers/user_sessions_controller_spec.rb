require 'spec_helper'

describe UserSessionsController do
  before(:each) do
    @user = Factory.create(:user)
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
