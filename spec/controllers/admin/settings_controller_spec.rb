require 'spec_helper'

describe Admin::SettingsController do
  before(:each) do
    @setting = Setting.new
    @setting.resource = IDENTIFIER
    @setting.key = 'key'
    @setting.value = 'value'
    @setting.hidden = false
    @setting.human_readable = 'Test Key'
    @setting.save!
    
    @normal_role = Role.new
    @normal_role.name = 'user'
    @normal_role.human_readable = 'Website User'
    @normal_role.save!
    
    @admin_role = Role.new
    @admin_role.name = 'admin'
    @admin_role.human_readable = 'Administrator'
    @admin_role.save!
    
    @user = User.new
    @user.username = 'test'
    @user.password = PASSWORD
    @user.password_confirmation = PASSWORD
    @user.email = 'test@example.com'
    @user.save!
    
    @user.role = @admin_role
    @user.save!
    
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
