require 'spec_helper'

describe PageController do
  before(:each) do
    FactoryBot.create(:time_zone)
    @page = FactoryBot.create(:page)
  end
  
  describe "GET 'show'" do
    it "should be successful" do
      get 'show', params: { :permalink => @page.permalink }
      response.should be_successful
    end
  end

end
