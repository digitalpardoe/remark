require 'spec_helper'

describe PageController do
  before(:each) do
    FactoryGirl.create(:time_zone)
    @page = FactoryGirl.create(:page)
  end
  
  describe "GET 'show'" do
    it "should be successful" do
      get 'show', :permalink => @page.permalink
      response.should be_success
    end
  end

end
