require 'spec_helper'

describe Admin::SettingsController do
  before(:each) do
    @setting = Factory.create(:setting)
    @user = Factory.create(:admin)
    session[:user_id] = @user.id
  end
  
  describe "basic test for application controller functionality" do
    it "should error and redirect" do
      session[:user_id] = nil
      get 'show'
      response.should redirect_to(root_path)
    end
  end

  describe "GET 'show'" do
    it "should be successful" do
      get 'show'
      response.should be_success
    end
  end

  describe "POST 'update'" do
    it "should be successful" do
      post 'update', :setting => { @setting.id => "some new value" }
      response.should redirect_to(:action => 'show')
    end
  end
end
