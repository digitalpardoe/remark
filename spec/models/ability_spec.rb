require 'spec_helper'

describe Ability do
  before(:each) do
    @normal_role = Role.new
    @normal_role.name = 'user'
    @normal_role.human_readable = 'Website User'
    @normal_role.save!
    
    @admin_role = Role.new
    @admin_role.name = 'admin'
    @admin_role.human_readable = 'Administrator'
    @admin_role.save!
    
    @normal_user = User.new
    @normal_user.username = 'test'
    @normal_user.password = PASSWORD
    @normal_user.password_confirmation = PASSWORD
    @normal_user.email = 'test@example.com'
    @normal_user.save!
    
    @admin_user = User.new
    @admin_user.username = 'admin'
    @admin_user.password = PASSWORD
    @admin_user.password_confirmation = PASSWORD
    @admin_user.email = 'admin@example.com'
    @admin_user.save!
    
    @admin_user.role = @admin_role
    @admin_user.save!
    
    @article = Article.new
    @article.title = 'This Is A Test Title'
    @article.body = "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Maecenas convallis convallis augue, a fringilla risus faucibus nec. Maecenas at nunc augue. Duis blandit posuere nisl a feugiat. Mauris porttitor justo consectetur tellus sodales eu aliquet enim lobortis. Curabitur urna augue, cursus ac posuere quis, pretium vel lectus. Etiam sit amet tortor vitae magna pellentesque eleifend ut non risus. Sed quis magna neque, sit amet interdum leo. In eleifend justo sagittis libero molestie et scelerisque ipsum tristique. Donec scelerisque venenatis mi, vitae egestas nisl luctus eget. Aliquam erat volutpat. Suspendisse potenti. Fusce at leo feugiat massa elementum ornare. Aenean aliquet leo vel lacus auctor ac fermentum nisi suscipit. Morbi mollis orci tortor. Morbi id viverra magna. Aenean volutpat tristique lorem. Ut scelerisque placerat libero rutrum molestie. Quisque scelerisque imperdiet nisl sit amet blandit. Proin lorem purus, sollicitudin non rutrum eget, varius at justo. Etiam ac velit vitae nisl tincidunt consequat eget vel libero.\n\nSed pulvinar, felis eget lobortis facilisis, nisl sapien congue lacus, sed viverra elit est non nibh. Cras rutrum eros et leo fringilla egestas. Etiam congue mollis lacinia. Fusce purus nisl, auctor non placerat pulvinar, auctor et purus. Curabitur ornare porttitor nibh, vel interdum ante convallis vel. Praesent in ante turpis. Nullam viverra enim a tellus auctor imperdiet. Nam pharetra dignissim metus eu facilisis. Nunc id elementum erat. Nulla varius, est id fringilla commodo, dolor metus consequat eros, vel tincidunt ante enim sed mauris. Pellentesque vel velit sed tortor vulputate auctor. Fusce at arcu turpis."
    @article.user = @admin_user
    @article.text_filter = 'markdown'
    @article.save!
    
    @page = Page.new
    @page.title = 'This Is A Test Page'
    @page.body = "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Maecenas convallis convallis augue, a fringilla risus faucibus nec. Maecenas at nunc augue. Duis blandit posuere nisl a feugiat. Mauris porttitor justo consectetur tellus sodales eu aliquet enim lobortis. Curabitur urna augue, cursus ac posuere quis, pretium vel lectus. Etiam sit amet tortor vitae magna pellentesque eleifend ut non risus. Sed quis magna neque, sit amet interdum leo. In eleifend justo sagittis libero molestie et scelerisque ipsum tristique. Donec scelerisque venenatis mi, vitae egestas nisl luctus eget. Aliquam erat volutpat. Suspendisse potenti. Fusce at leo feugiat massa elementum ornare. Aenean aliquet leo vel lacus auctor ac fermentum nisi suscipit. Morbi mollis orci tortor. Morbi id viverra magna. Aenean volutpat tristique lorem. Ut scelerisque placerat libero rutrum molestie. Quisque scelerisque imperdiet nisl sit amet blandit. Proin lorem purus, sollicitudin non rutrum eget, varius at justo. Etiam ac velit vitae nisl tincidunt consequat eget vel libero.\n\nSed pulvinar, felis eget lobortis facilisis, nisl sapien congue lacus, sed viverra elit est non nibh. Cras rutrum eros et leo fringilla egestas. Etiam congue mollis lacinia. Fusce purus nisl, auctor non placerat pulvinar, auctor et purus. Curabitur ornare porttitor nibh, vel interdum ante convallis vel. Praesent in ante turpis. Nullam viverra enim a tellus auctor imperdiet. Nam pharetra dignissim metus eu facilisis. Nunc id elementum erat. Nulla varius, est id fringilla commodo, dolor metus consequat eros, vel tincidunt ante enim sed mauris. Pellentesque vel velit sed tortor vulputate auctor. Fusce at arcu turpis."
    @page.draft = true
    @page.user = @admin_user
    @page.text_filter = 'markdown'
    @page.save!
  end
  
  it "allows operating on any model if an administrator" do
    ability = Ability.new(@admin_user)
    Dir['app/models/*.rb'].map { |f| File.basename(f, '.*').camelize.constantize }.each do |model|
      ability.can?(:manage, model).should be true
    end
  end
  
  it "allows updating of own user record" do
    ability = Ability.new(@normal_user)
    ability.can?(:update, @normal_user).should be true
  end
  
  it "doesn't allow updating of other users record" do
    ability = Ability.new(@normal_user)
    ability.can?(:update, @admin_user).should be false
  end
  
  it "allows a user to read their own article" do
    @article.user = @normal_user
    @article.save!
    ability = Ability.new(@normal_user)
    ability.can?(:read, @article).should be true
  end
  
  it "allows a user to update their own article" do
    @article.user = @normal_user
    @article.save!
    ability = Ability.new(@normal_user)
    ability.can?(:update, @article).should be true
  end
  
  it "allows a user to destroy their own article" do
    @article.user = @normal_user
    @article.save!
    ability = Ability.new(@normal_user)
    ability.can?(:destroy, @article).should be true
  end
  
  it "allows anyone to create a user" do
    ability = Ability.new(nil)
    ability.can?(:create, User.new).should be true
  end
  
  it "doesn't allow non-published article reading" do
    ability = Ability.new(nil)
    ability.can?(:read, @article).should be false
  end
  
  it "doesn't allow non-published page reading" do
    ability = Ability.new(nil)
    ability.can?(:read, @page).should be false
  end
  
  it "doesn't allow a non-published article to be read by a random logged in user" do
    @other_user = User.new
    @other_user.username = 'other'
    @other_user.password = PASSWORD
    @other_user.password_confirmation = PASSWORD
    @other_user.email = 'other@example.com'
    @other_user.save!
    
    @article.user = @other_user
    @article.save!
    
    ability = Ability.new(@normal_user)
    ability.can?(:read, @article).should be false
  end
  
  it "allows anyone to read a published article" do
    @article.draft = false
    @article.save
    
    ability = Ability.new(nil)
    ability.can?(:read, @article).should be true
  end
end
