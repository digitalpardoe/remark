class RemoveTextFilterIdFromAndTextFilterToArticleAndPage < ActiveRecord::Migration
  def self.up
    remove_column :articles, :text_filter_id
    remove_column :pages, :text_filter_id
    
    add_column :articles, :text_filter, :string
    add_column :pages, :text_filter, :string
  end

  def self.down
    remove_column :articles, :text_filter
    remove_column :pages, :text_filter
    
    add_column :articles, :text_filter_id, :integer
    add_column :pages, :text_filter_id, :integer
  end
end
