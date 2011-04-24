class DropTextFilters < ActiveRecord::Migration
  def self.up
    drop_table :text_filters
  end

  def self.down
    create_table :text_filters do |t|
      t.string :name
      t.string :human_readable

      t.timestamps
    end
    
    add_index :text_filters, :name, :unique => true
  end
end
