require 'spec_helper'

describe Admin::DocumentsController do
  before(:each) do
    @user = FactoryBot.create(:admin)
    session[:user_id] = @user.id
  end

  describe "GET 'index'" do
    it "should be successful" do
      get 'index'
      response.should be_successful
    end
  end

  describe "GET 'new'" do
    it "should be successful" do
      get 'new'
      response.should be_successful
    end
  end

#  describe "GET 'create'" do
#    it "should be successful" do
#      get 'create'
#      response.should be_successful
#    end
#  end

#  describe "DELETE 'destroy'" do
#    it "should be successful" do
#      delete 'destroy'
#      response.should be_successful
#    end
#  end

end
