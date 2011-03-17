class CreateTextFilters < ActiveRecord::Migration
  def self.up
    create_table :text_filters do |t|
      t.string :name
      t.string :human_readable

      t.timestamps
    end
    
    add_index :text_filters, :name, :unique => true
  end

  def self.down
    drop_table :text_filters
  end
end
