require 'spec_helper'

describe Admin::ArticlesController do
  before(:each) do
    @user = Factory.create(:admin)
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

#  describe "GET 'edit'" do
#    it "should be successful" do
#      get 'edit'
#      response.should be_success
#    end
#  end

end
