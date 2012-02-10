require 'spec_helper'

describe Page do
  it "stores a valid page" do
    lambda { Factory(:page) }.should_not raise_error
  end
end
