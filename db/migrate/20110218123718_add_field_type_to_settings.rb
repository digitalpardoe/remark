class AddFieldTypeToSettings < ActiveRecord::Migration[6.1]
  def self.up
    add_column :settings, :field_type, :string, :null => true
  end

  def self.down
    remove_column :settings, :field_type
  end
end
