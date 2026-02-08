class ChangeSettingsValueType < ActiveRecord::Migration[6.1]
  def self.up
    change_column :settings, :value, :text
  end

  def self.down
    change_column :settings, :value, :string
  end
end
