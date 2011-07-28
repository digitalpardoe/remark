require 'spec_helper'

describe Setting do
  it "stores a valid setting" do
    lambda { Factory(:setting, :resource => 'com.test') }.should_not raise_error
  end
  
  it "protects 'hidden' from mass assignment" do
    setting = Setting.create!(Factory.attributes_for(:setting).merge({:hidden => true}))
    setting.hidden.should be false
  end
  
  it "only returns application settings" do
    Factory(:setting, :resource => IDENTIFIER)
    Factory(:setting, :resource => 'com.test', :human_readable => 'Other Test Key')
    
    Setting.application.count.should == 1
  end
  
  it "retrieves an instance of a setting" do
    Factory(:setting)
    Setting.resource(Factory.attributes_for(:setting)[:resource]).value(Factory.attributes_for(:setting)[:key].to_sym).should == Factory.attributes_for(:setting)[:value]
  end
  
  describe "hidden records" do
    it "defaults to not being show" do
      Factory(:setting)
      Factory(:setting, :key => 'new_key', :hidden => true, :human_readable => 'Other Test Key')
      Setting.all.count.should == 1
    end
    
    it "can be overridden" do
      Factory(:setting)
      Factory(:setting, :key => 'new_key', :hidden => true, :human_readable => 'Other Test Key')
      Setting.hidden.count.should == 1
    end
  end
  
  describe "validations:" do
    it "shouldn't validate due to missing resource" do
      lambda { Factory(:setting, :resource => nil) }.should raise_error(ActiveRecord::RecordInvalid)
    end
    
    it "shouldn't validate due to missing key" do
      lambda { Factory(:setting, :key => nil) }.should raise_error(ActiveRecord::RecordInvalid)
    end
    
    it "shouldn't validate due to missing human readable name" do
      lambda { Factory(:setting, :human_readable => nil) }.should raise_error(ActiveRecord::RecordInvalid)
    end
    
    it "shouldn't validate due to duplicate key in resource" do
      Factory(:setting)
      lambda { Factory(:setting, :human_readable => 'Other Human Readable') }.should raise_error(ActiveRecord::RecordInvalid)
    end
    
    it "shouldn't validate due to duplicate human readable name" do
      Factory(:setting)
      lambda { Factory(:setting, :key => 'other') }.should raise_error(ActiveRecord::RecordInvalid)
    end
    
    it "shouldn't validate because of duplicate human readable, even outside a resource" do
      Factory(:setting)
      lambda { Factory(:setting, :resource => 'com.example') }.should raise_error(ActiveRecord::RecordInvalid)
    end
    
    it "should validate because we can have duplicate keys outside a resource" do
      Factory(:setting)
      lambda { Factory(:setting, :resource => 'com.example', :human_readable => 'Other Human Readable') }.should_not raise_error(ActiveRecord::RecordInvalid)
    end
  end
end
