require 'spec_helper'

describe Role do
  it "stores a valid role" do
    lambda { FactoryGirl.create(:user_role) }.should_not raise_error
  end
  
  it "retrieves a role object" do
    FactoryGirl.create(:user_role)
    Role.retrieve(FactoryGirl.attributes_for(:user_role)[:name]).name.should == FactoryGirl.attributes_for(:user_role)[:name]
  end
  
  describe "relationship with" do
    describe "users:" do
      it "has a working relationship" do
        FactoryGirl.create(:user_role)
        User.create(FactoryGirl.attributes_for(:user))
        User.create(FactoryGirl.attributes_for(:user, :username => 'another_user', :password => 'random_password', :password_confirmation => 'random_password'))
        Role.all.first.users.length.should == 2
      end
    end
  end
  
  describe "validation:" do
    it "shouldn't validate due to missing name" do
      lambda { FactoryGirl.create(:user_role, :name => nil) }.should raise_error(ActiveRecord::RecordInvalid)
    end
    
    it "should't validate due to missing human readable name" do
      lambda { FactoryGirl.create(:user_role, :human_readable => nil) }.should raise_error(ActiveRecord::RecordInvalid)
    end
    
    it "shouldn't validate due to duplicate name" do
      FactoryGirl.create(:user_role)
      lambda { FactoryGirl.create(:admin_role, :name => FactoryGirl.attributes_for(:user_role)[:name]) }.should raise_error(ActiveRecord::RecordInvalid)
    end
    
    it "shouldn't validate due to duplicate human readable name" do
      FactoryGirl.create(:user_role)
      lambda { FactoryGirl.create(:admin_role, :human_readable => FactoryGirl.attributes_for(:user_role)[:human_readable]) }.should raise_error(ActiveRecord::RecordInvalid)
    end
  end
end
