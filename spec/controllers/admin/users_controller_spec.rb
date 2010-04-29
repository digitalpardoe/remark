require 'spec_helper'

describe Admin::UsersController do
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

  describe "GET 'index'" do
    it "should be successful" do
      get 'index'
      response.should be_success
    end
  end

  describe "GET 'new'" do
    it "should be successful" do
      get 'new'
      response.should be_success
    end
  end

  describe "GET 'edit'" do
    it "should be successful" do
      get 'edit', :id => @user.id
      response.should be_success
    end
  end

  describe "PUT 'create'" do
    it "should be successful" do
      put 'create', :user => { :username => 'username', :password => 'testing', :password_confirmation => 'testing', :email => 'username@example.com' }
      response.should redirect_to(:action => 'index')
    end
    
    it "shouldn't be successful" do
      put 'create', :user => { :username => 'username', :password => 'testing', :password_confirmation => 'test', :email => 'username@example.com' }
      response.should render_template('admin/users/new')
    end
  end

  describe "PUT 'update'" do
    it "should be successful" do
      put 'update', :id => @user.id, :user => { :password => 'testing', :password_confirmation => 'testing' }
      response.should redirect_to(:action => 'index')
    end
    
    it "shouldn't be successful" do
      put 'update', :id => @user.id, :user => { :email => 'test' }
      response.should render_template('admin/users/edit')
    end
  end

  describe "DELETE 'destroy'" do
    it "should be successful" do
      delete 'destroy', :id => @user.id
      response.should redirect_to(:action => 'index')
    end
  end
end
