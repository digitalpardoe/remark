class RemoveDisqus < ActiveRecord::Migration[6.1]
  def up
    setting = Setting.application.where(:key => 'disqus_shortname').first
    if setting
      setting.delete
    end
  end

  def down
    Setting.create!( { :key => 'disqus_shortname', :human_readable => "DISQUS Shortname", :required => false, :resource => IDENTIFIER } )
  end
  
end
