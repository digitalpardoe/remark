# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Mayor.create(:name => 'Daley', :city => cities.first)

Setting.create!(:resource => IDENTIFIER, :key => 'name', :value => 'Remark', :hidden => false, :human_readable => "Blog Name")
Setting.create!(:resource => IDENTIFIER, :key => 'subtitle', :value => 'A Rails Blogging Engine', :hidden => false, :human_readable => "Blog Subtitle")
