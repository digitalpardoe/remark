# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Mayor.create(:name => 'Daley', :city => cities.first)

[
  {:resource => IDENTIFIER, :key => 'name', :value => 'Remark', :hidden => false, :human_readable => "Blog Name", :required => true},
  {:resource => IDENTIFIER, :key => 'subtitle', :value => 'A Rails Blogging Engine', :hidden => false, :human_readable => "Blog Subtitle", :required => true},
  {:resource => IDENTIFIER, :key => 'url', :value => 'example.com', :hidden => false, :human_readable => "Blog URL", :required => true},
  {:resource => IDENTIFIER, :key => 'tracking', :hidden => false, :human_readable => "Tracking Code", :required => false, :field_type => "text_area"},
  {:resource => IDENTIFIER, :key => 'text_filter', :value => DEFAULT_TEXT_FILTER, :hidden => false, :human_readable => "Default Text Filter", :required => true, :field_type => "collection_select#constant"}
].each do |setting|
  Setting.create!(setting)
end

[
  {:name => 'admin', :human_readable => 'Administrator'},
  {:name => 'user', :human_readable => 'Website User'}
].each do |user|
  Role.create!(user)
end
