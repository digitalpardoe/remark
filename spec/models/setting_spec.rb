require 'spec_helper'

describe Setting do
  it "stores a valid setting" do
    lambda { FactoryGirl.create(:setting, :resource => 'com.test') }.should_not raise_error
  end
  
  it "protects 'hidden' from mass assignment" do
    lambda { Setting.create!(FactoryGirl.attributes_for(:setting).merge({:hidden => true})) }.should raise_error(ActiveModel::MassAssignmentSecurity::Error)
  end
  
  it "only returns application settings" do
    FactoryGirl.create(:setting, :resource => IDENTIFIER)
    FactoryGirl.create(:setting, :resource => 'com.test', :human_readable => 'Other Test Key')
    
    Setting.application.count.should == 1
  end
  
  it "retrieves an instance of a setting" do
    FactoryGirl.create(:setting)
    Setting.resource(FactoryGirl.attributes_for(:setting)[:resource]).value(FactoryGirl.attributes_for(:setting)[:key].to_sym).should == FactoryGirl.attributes_for(:setting)[:value]
  end
  
  describe "hidden records" do
    it "defaults to not being show" do
      FactoryGirl.create(:setting)
      FactoryGirl.create(:setting, :key => 'new_key', :hidden => true, :human_readable => 'Other Test Key')
      Setting.all.count.should == 1
    end
    
    it "can be overridden" do
      FactoryGirl.create(:setting)
      FactoryGirl.create(:setting, :key => 'new_key', :hidden => true, :human_readable => 'Other Test Key')
      Setting.hidden.count.should == 1
    end
  end
  
  describe "validations:" do
    it "shouldn't validate due to missing resource" do
      lambda { FactoryGirl.create(:setting, :resource => nil) }.should raise_error(ActiveRecord::RecordInvalid)
    end
    
    it "shouldn't validate due to missing key" do
      lambda { FactoryGirl.create(:setting, :key => nil) }.should raise_error(ActiveRecord::RecordInvalid)
    end
    
    it "shouldn't validate due to missing human readable name" do
      lambda { FactoryGirl.create(:setting, :human_readable => nil) }.should raise_error(ActiveRecord::RecordInvalid)
    end
    
    it "shouldn't validate due to duplicate key in resource" do
      FactoryGirl.create(:setting)
      lambda { FactoryGirl.create(:setting, :human_readable => 'Other Human Readable') }.should raise_error(ActiveRecord::RecordInvalid)
    end
    
    it "shouldn't validate due to duplicate human readable name" do
      FactoryGirl.create(:setting)
      lambda { FactoryGirl.create(:setting, :key => 'other') }.should raise_error(ActiveRecord::RecordInvalid)
    end
    
    it "shouldn't validate because of duplicate human readable, even outside a resource" do
      FactoryGirl.create(:setting)
      lambda { FactoryGirl.create(:setting, :resource => 'com.example') }.should raise_error(ActiveRecord::RecordInvalid)
    end
    
    it "should validate because we can have duplicate keys outside a resource" do
      FactoryGirl.create(:setting)
      lambda { FactoryGirl.create(:setting, :resource => 'com.example', :human_readable => 'Other Human Readable') }.should_not raise_error(ActiveRecord::RecordInvalid)
    end
  end
end
