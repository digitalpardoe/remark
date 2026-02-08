require 'spec_helper'

describe Admin::SettingsController do
  before(:each) do
    @setting = FactoryBot.create(:setting)
    @user = FactoryBot.create(:admin)
    session[:user_id] = @user.id
  end
  
  describe "basic test for application controller functionality" do
    it "should error and redirect" do
      session[:user_id] = nil
      get 'show'
      response.should redirect_to(new_user_session_path)
    end
  end

  describe "GET 'show'" do
    it "should be successful" do
      get 'show'
      response.should be_successful
    end
  end

  describe "POST 'update'" do
    it "should be successful" do
      post 'update', params: { :setting => { @setting.id => "some new value" } }
      response.should redirect_to(:action => 'show')
    end
  end
end
