class AddPaperclipToDocuments < ActiveRecord::Migration
  class Document < ActiveRecord::Base
  end
  
  def self.up
    rename_column :documents, :name, :paperclip_file_name
    rename_column :documents, :content_type, :paperclip_content_type
    rename_column :documents, :size, :paperclip_file_size
    
    add_column :documents, :paperclip_updated_at, :datetime
    
    Document.reset_column_information
    
    documents = Document.unscoped.all
    documents.each do |d|
      d.paperclip_file_name = "#{d.paperclip_file_name}.#{d.extension}"
      d.paperclip_updated_at = d.updated_at
      d.save
    end
    
    remove_column :documents, :extension
  end

  def self.down
    rename_column :documents, :paperclip_file_name, :name
    rename_column :documents, :paperclip_content_type, :content_type
    rename_column :documents, :paperclip_file_size, :size
    
    add_column :documents, :extension, :string
    
    Document.reset_column_information
    
    documents = Document.unscoped.all
    documents.each do |d|
      file_parts = d.name.split('.')
      d.extension = file_parts.pop
      d.name = file_parts.join('.')
      d.updated_at = d.paperclip_updated_at
      d.save
    end
    
    remove_column :documents, :paperclip_updated_at
  end
end
