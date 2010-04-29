require 'spec_helper'

describe Tag do
  before(:each) do
    @tag = Tag.new
    @tag.name = 'test'
  end
  
  it "stores a valid tag" do
    lambda { @tag.save! }.should_not raise_error
  end
  
  describe "validation:" do
    it "shouldn't validate due to missing name" do
      @tag.name = nil
      lambda { @tag.save! }.should raise_error(ActiveRecord::RecordInvalid)
    end
    
    it "shouldn't validate due to duplicate name" do
      @tag.save!
      new_tag = Tag.new
      new_tag.name = @tag.name
      lambda { new_tag.save! }.should raise_error(ActiveRecord::RecordInvalid)
    end
  end
end
