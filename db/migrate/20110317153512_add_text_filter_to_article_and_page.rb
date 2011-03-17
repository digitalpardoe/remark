class AddTextFilterToArticleAndPage < ActiveRecord::Migration
  def self.up
    add_column :articles, :text_filter_id, :integer
    add_column :pages, :text_filter_id, :integer
  end

  def self.down
    remove_column :articles, :text_filter_id
    remove_column :pages, :text_filter_id
  end
end
