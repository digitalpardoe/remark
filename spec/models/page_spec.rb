require 'spec_helper'

describe Page do
  it "stores a valid page" do
  	FactoryGirl.create(:time_zone)
    lambda { FactoryGirl.create(:page) }.should_not raise_error
  end
end
