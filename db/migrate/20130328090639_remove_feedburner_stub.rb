class RemoveFeedburnerStub < ActiveRecord::Migration[6.1]
  def up
    setting = Setting.application.where(:key => 'feedburner_stub').first
    if setting
      setting.delete
    end
  end

  def down
    Setting.create!( { :key => 'feedburner_stub', :human_readable => "FeedBurner Stub", :required => false, :resource => IDENTIFIER } )
  end
end
