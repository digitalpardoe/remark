# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Mayor.create(:name => 'Daley', :city => cities.first)

[
  {:key => 'name', :value => 'Remark', :human_readable => "Blog Name", :required => true},
  {:key => 'subtitle', :value => 'A Rails Blogging Engine', :human_readable => "Blog Subtitle", :required => true},
  {:key => 'url', :value => 'http://example.com/', :human_readable => "Blog URL", :required => true, :field_type => "url_field"},
  {:key => 'tracking', :human_readable => "Tracking Code", :required => false, :field_type => "text_area"},
  {:key => 'text_filter', :value => DEFAULT_TEXT_FILTER, :human_readable => "Default Text Filter", :required => true, :field_type => "collection_select#constant"},
  {:key => 'per_page', :value => 5, :human_readable => "Articles Per Page", :required => true},
  {:key => 'time_zone', :value => DEFAULT_TIME_ZONE, :human_readable => "Time Zone", :required => true, :field_type => "time_zone"}
].each do |setting|
  Setting.create!( setting.merge( { :resource => IDENTIFIER } ) )
end

[
  {:name => 'admin', :human_readable => 'Administrator'},
  {:name => 'user', :human_readable => 'Website User'}
].each do |role|
  Role.create!(role)
end

@user = User.create!({:username => 'admin', :password => 'password', :password_confirmation => 'password', :email => 'admin@example.com'})
@user.role = Role.where(:name => 'admin').first
@user.save!
