require 'spec_helper'

describe Admin::UsersController do
  before(:each) do
    @user = FactoryGirl.create(:admin)
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
