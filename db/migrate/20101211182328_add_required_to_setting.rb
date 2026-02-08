class AddRequiredToSetting < ActiveRecord::Migration[6.1]
  def self.up
    add_column :settings, :required, :boolean, :default => false
  end

  def self.down
    remove_column :settings, :required
  end
end
