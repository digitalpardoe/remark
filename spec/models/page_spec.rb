require 'spec_helper'

describe Page do
  it "stores a valid page" do
  	FactoryBot.create(:time_zone)
    lambda { FactoryBot.create(:page) }.should_not raise_error
  end
end
