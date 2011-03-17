require 'spec_helper'

describe TextFilter do
  before(:each) do
    @text_filter = Factory.stub(:text_filter)
  end
  
  it "stores a valid text filter" do
    lambda { @text_filter.save! }.should_not raise_error
  end
  
  describe "validation:" do
    it "shouldn't validate due to missing name" do
      @text_filter.name = nil
      lambda { @text_filter.save! }.should raise_error(ActiveRecord::RecordInvalid)
    end
    
    it "should't validate due to missing human readable name" do
      @text_filter.human_readable = nil
      lambda { @text_filter.save! }.should raise_error(ActiveRecord::RecordInvalid)
    end
  end
end
