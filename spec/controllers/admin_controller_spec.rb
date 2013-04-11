require 'spec_helper'

describe AdminController do
  before(:each) do
    @admin = FactoryGirl.create(:admin)
  end
  
  describe "GET index" do
    it "should be successful" do
      session[:user_id] = @admin.id
      
      get 'index'
      response.should redirect_to("/admin/articles")
    end
  end
end
