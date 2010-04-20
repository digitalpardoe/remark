class CreateSettings < ActiveRecord::Migration
  def self.up
    create_table :settings do |t|
      t.string :resource
      t.string :key
      t.string :value
      t.boolean :hidden, :default => false
      t.string :human_readable

      t.timestamps
    end
    
    add_index :settings, [:resource, :key], :unique => true
  end

  def self.down
    drop_table :settings
  end
end
