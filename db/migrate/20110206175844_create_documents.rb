class CreateDocuments < ActiveRecord::Migration
  def self.up
    create_table :documents do |t|
      t.string :name
      t.string :extension
      t.integer :size
      t.string :content_type

      t.timestamps
    end
    
    add_index :documents, [:name, :extension], :unique => true
  end

  def self.down
    drop_table :documents
  end
end
