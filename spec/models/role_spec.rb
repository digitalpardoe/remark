require 'spec_helper'

describe Role do
  before(:each) do
    @role = Factory.stub(:user_role)
    @other_role = Factory.stub(:admin_role)
    @user = Factory.stub(:user)
    @other_user = Factory.stub(:user, :username => @user.username[0..2], :password => @user.password, :password_confirmation => @user.password_confirmation)
  end
  
  it "stores a valid user" do
    lambda { @role.save! }.should_not raise_error
  end
  
  it "retrieves a role object" do
    @role.save!
    Role.retrieve(@role.name).name.should == @role.name
  end
  
  describe "relationship with" do
    describe "users:" do
      it "has a working relationship" do
        @role.save!
        @user.save!
        @other_user.save!
        @role.users.length.should == 2
      end
    end
  end
  
  describe "validation:" do
    it "shouldn't validate due to missing name" do
      @role.name = nil
      lambda { @role.save! }.should raise_error(ActiveRecord::RecordInvalid)
    end
    
    it "should't validate due to missing human readable name" do
      @role.human_readable = nil
      lambda { @role.save! }.should raise_error(ActiveRecord::RecordInvalid)
    end
    
    it "shouldn't validate due to duplicate name" do
      @role.save!
      @other_role.name = @role.name
      lambda { @other_role.save! }.should raise_error(ActiveRecord::RecordInvalid)
    end
    
    it "shouldn't validate due to duplicate human readable name" do
      @role.save!
      @other_role.human_readable = @role.human_readable
      lambda { @other_role.save! }.should raise_error(ActiveRecord::RecordInvalid)
    end
  end
end
