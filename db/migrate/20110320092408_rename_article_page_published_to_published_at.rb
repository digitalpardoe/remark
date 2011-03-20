class RenameArticlePagePublishedToPublishedAt < ActiveRecord::Migration
  def self.up
    rename_column :articles, :published, :published_at
    rename_column :pages, :published, :published_at
  end

  def self.down
    rename_column :articles, :published_at, :published
    rename_column :pages, :published_at, :published
  end
end
