require 'spec_helper'

describe Role do
  before(:each) do
    @role = Role.new
    @role.name = 'user'
    @role.human_readable = 'Website User'
    
    @other_role = Role.new
    @other_role.name = 'admin'
    @other_role.human_readable = 'Administrator'
    
    @user = User.new
    @user.username = 'test'
    @user.password = PASSWORD
    @user.password_confirmation = PASSWORD
    @user.email = 'test@example.com'
    
    @other_user = User.new
    @other_user.username = @user.username[0..2]
    @other_user.password = @user.password
    @other_user.password_confirmation = @user.password_confirmation
    @other_user.email = @user.email.gsub('test', 'testing')
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
