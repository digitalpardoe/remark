require 'spec_helper'

describe Setting do
  before(:each) do
    @setting = Factory.stub(:setting, :resource => 'com.test')
    @other_setting = Factory.stub(:setting, :resource => 'com.test', :human_readable => 'Other Test Key')
  end
  
  it "stores a valid setting" do
    lambda { @setting.save! }.should_not raise_error
  end
  
  it "protects 'hidden' from mass assignment" do
    @setting.hidden = true
    setting = Setting.create!(:resource => @setting.resource, :key => @setting.key, :value => @setting.value, :hidden => @setting.hidden, :human_readable => @setting.human_readable)
    setting.hidden.should be false
  end
  
  it "only returns application settings" do
    @setting.resource = IDENTIFIER
    @setting.save!
    @other_setting.save!
    
    Setting.application.count.should == 1
  end
  
  it "retrieves an instance of a setting" do
    @setting.save!
    Setting.resource(@setting.resource).value(@setting.key.to_sym).should == @setting.value
  end
  
  describe "hidden records" do
    it "defaults to not being show" do
      @setting.save!
      @other_setting.key = 'new_key'
      @other_setting.hidden = true
      @other_setting.save!
      Setting.all.count.should == 1
    end
    
    it "can be overridden" do
      @setting.save!
      @other_setting.key = 'new_key'
      @other_setting.hidden = true
      @other_setting.save!
      Setting.hidden.count.should == 1
    end
  end
  
  describe "validations:" do
    it "shouldn't validate due to missing resource" do
      @setting.resource = nil
      lambda { @setting.save! }.should raise_error(ActiveRecord::RecordInvalid)
    end
    
    it "shouldn't validate due to missing key" do
      @setting.key = nil
      lambda { @setting.save! }.should raise_error(ActiveRecord::RecordInvalid)
    end
    
    it "shouldn't validate due to missing human readable name" do
      @setting.human_readable = nil
      lambda { @setting.save! }.should raise_error(ActiveRecord::RecordInvalid)
    end
    
    it "shouldn't validate due to duplicate key in resource" do
      @setting.save!
      lambda { @other_setting.save! }.should raise_error(ActiveRecord::RecordInvalid)
    end
    
    it "shouldn't validate due to duplicate human readable name" do
      @setting.save!
      @other_setting.human_readable = @setting.human_readable
      lambda { @other_setting.save! }.should raise_error(ActiveRecord::RecordInvalid)
    end
    
    it "should validate because we can have duplicate keys outside a resource" do
      @setting.save!
      @other_setting.resource = 'com.example'
      lambda { @other_setting.save! }.should_not raise_error(ActiveRecord::RecordInvalid)
    end
  end
end
