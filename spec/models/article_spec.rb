require 'spec_helper'

describe Article do
  before(:each) do
    @setting = Setting.new
    @setting.resource = IDENTIFIER
    @setting.key = 'url'
    @setting.value = 'example.com'
    @setting.hidden = false
    @setting.human_readable = 'Blog URL'
    @setting.save!
        
    @role = Role.new
    @role.name = 'user'
    @role.human_readable = 'Website User'
    @role.save!
    
    @user = User.new
    @user.username = 'test'
    @user.password = PASSWORD
    @user.password_confirmation = PASSWORD
    @user.email = 'test@example.com'
    @user.save!
    
    @article = Article.new
    @article.title = 'This Is A Test Title'
    @article.body = "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Maecenas convallis convallis augue, a fringilla risus faucibus nec. Maecenas at nunc augue. Duis blandit posuere nisl a feugiat. Mauris porttitor justo consectetur tellus sodales eu aliquet enim lobortis. Curabitur urna augue, cursus ac posuere quis, pretium vel lectus. Etiam sit amet tortor vitae magna pellentesque eleifend ut non risus. Sed quis magna neque, sit amet interdum leo. In eleifend justo sagittis libero molestie et scelerisque ipsum tristique. Donec scelerisque venenatis mi, vitae egestas nisl luctus eget. Aliquam erat volutpat. Suspendisse potenti. Fusce at leo feugiat massa elementum ornare. Aenean aliquet leo vel lacus auctor ac fermentum nisi suscipit. Morbi mollis orci tortor. Morbi id viverra magna. Aenean volutpat tristique lorem. Ut scelerisque placerat libero rutrum molestie. Quisque scelerisque imperdiet nisl sit amet blandit. Proin lorem purus, sollicitudin non rutrum eget, varius at justo. Etiam ac velit vitae nisl tincidunt consequat eget vel libero.\n\nSed pulvinar, felis eget lobortis facilisis, nisl sapien congue lacus, sed viverra elit est non nibh. Cras rutrum eros et leo fringilla egestas. Etiam congue mollis lacinia. Fusce purus nisl, auctor non placerat pulvinar, auctor et purus. Curabitur ornare porttitor nibh, vel interdum ante convallis vel. Praesent in ante turpis. Nullam viverra enim a tellus auctor imperdiet. Nam pharetra dignissim metus eu facilisis. Nunc id elementum erat. Nulla varius, est id fringilla commodo, dolor metus consequat eros, vel tincidunt ante enim sed mauris. Pellentesque vel velit sed tortor vulputate auctor. Fusce at arcu turpis."
    @article.user = @user
  end
  
  it "stores a valid article" do
    lambda { @article.save! }.should_not raise_error
  end
  
  it "generates a permalink" do
    @article.save!
    @article.permalink.should == 'this-is-a-test-title'
  end
  
  it "doesn't allow resetting of uuid" do
    @article.save!
    uuid = @article.uuid
    article = Article.find(@article.id)
    article.uuid = 'random-string'
    article.save!
    Article.find(@article.id).uuid.should == uuid
  end
  
  it "set the published date when the article is no longer a draft" do
    @article.save!
    @article.published.should be nil
    @article.draft = false
    @article.save!
    @article.published.should_not be nil
  end
  
  it "can generate a permalink from a complex title" do
    @article.title = 'This! Is  A@@@ Test Title__-- With-Some Punctuation.'
    @article.save!
    @article.permalink.should == 'this-is-a-test-title-with-some-punctuation'
  end
  
  describe "relationship with" do
    describe "tag:" do
      it "should parse the tags correctly" do
        @article.composite_tags = "These, Are, Some Tags"
        @article.save!
        @article.tags.size.should == 3
        Tag.all.count.should == 3
      end
      
      it "shouldn't create more tags when they already exist" do
        @article.composite_tags = "These, Are, Some Tags"
        @article.save!
        @article.composite_tags = "These, Are, Some Tags, With, Some, Extra"
        @article.save!
        Tag.all.count.should == 6
      end
    end
    
    describe "user:" do
      it "should store the user" do
        @article.save!
        @article.user.should_not be nil
      end
    end
  end
  
  describe "validation:" do
    it "shouldn't validate due to missing title" do
      @article.title = nil
      lambda { @article.save! }.should raise_error(ActiveRecord::RecordInvalid)
    end
    
    it "shouldn't validate due to missing body" do
      @article.body = nil
      lambda { @article.save! }.should raise_error(ActiveRecord::RecordInvalid)
    end
    
    it "shouldn't validate due to missing user" do
      @article.user = nil
      lambda { @article.save! }.should raise_error(ActiveRecord::RecordInvalid)
    end
    
    it "shouldn't validate due to an incorrectly formatted permalink (spaces)" do
      @article.permalink = "This Format Is Incorrect"
      lambda { @article.save! }.should raise_error(ActiveRecord::RecordInvalid)
    end
    
    it "shouldn't validate due to an incorrectly formatted permalink (trailing dash)" do
      @article.permalink = "this-format-is-incorrect-"
      lambda { @article.save! }.should raise_error(ActiveRecord::RecordInvalid)
    end
    
    it "shouldn't validate due to an incorrectly formatted permalink (punctuation)" do
      @article.permalink = "this!-may-initially-look-correct"
      lambda { @article.save! }.should raise_error(ActiveRecord::RecordInvalid)
    end
    
    it "should validate with a different valid permalink" do
      @article.permalink = "thisshouldwork"
      lambda { @article.save! }.should_not raise_error
    end
  end
end
