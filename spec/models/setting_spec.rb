require 'spec_helper'

describe Setting do
  it "stores a valid setting" do
    lambda { FactoryBot.create(:setting, :resource => 'com.test') }.should_not raise_error
  end
  
  it "only returns application settings" do
    FactoryBot.create(:setting, :resource => IDENTIFIER)
    FactoryBot.create(:setting, :resource => 'com.test', :human_readable => 'Other Test Key')
    
    Setting.application.count.should == 1
  end
  
  it "retrieves an instance of a setting" do
    FactoryBot.create(:setting)
    Setting.resource(FactoryBot.attributes_for(:setting)[:resource]).value(FactoryBot.attributes_for(:setting)[:key].to_sym).should == FactoryBot.attributes_for(:setting)[:value]
  end
  
  describe "hidden records" do
    it "defaults to not being show" do
      FactoryBot.create(:setting)
      FactoryBot.create(:setting, :key => 'new_key', :hidden => true, :human_readable => 'Other Test Key')
      Setting.all.count.should == 1
    end
    
    it "can be overridden" do
      FactoryBot.create(:setting)
      FactoryBot.create(:setting, :key => 'new_key', :hidden => true, :human_readable => 'Other Test Key')
      Setting.hidden.count.should == 1
    end
  end
  
  describe "validations:" do
    it "shouldn't validate due to missing resource" do
      lambda { FactoryBot.create(:setting, :resource => nil) }.should raise_error(ActiveRecord::RecordInvalid)
    end
    
    it "shouldn't validate due to missing key" do
      lambda { FactoryBot.create(:setting, :key => nil) }.should raise_error(ActiveRecord::RecordInvalid)
    end
    
    it "shouldn't validate due to missing human readable name" do
      lambda { FactoryBot.create(:setting, :human_readable => nil) }.should raise_error(ActiveRecord::RecordInvalid)
    end
    
    it "shouldn't validate due to duplicate key in resource" do
      FactoryBot.create(:setting)
      lambda { FactoryBot.create(:setting, :human_readable => 'Other Human Readable') }.should raise_error(ActiveRecord::RecordInvalid)
    end
    
    it "shouldn't validate due to duplicate human readable name" do
      FactoryBot.create(:setting)
      lambda { FactoryBot.create(:setting, :key => 'other') }.should raise_error(ActiveRecord::RecordInvalid)
    end
    
    it "shouldn't validate because of duplicate human readable, even outside a resource" do
      FactoryBot.create(:setting)
      lambda { FactoryBot.create(:setting, :resource => 'com.example') }.should raise_error(ActiveRecord::RecordInvalid)
    end
    
    it "should validate because we can have duplicate keys outside a resource" do
      FactoryBot.create(:setting)
      lambda { FactoryBot.create(:setting, :resource => 'com.example', :human_readable => 'Other Human Readable') }.should_not raise_error(ActiveRecord::RecordInvalid)
    end
  end
end
