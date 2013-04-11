class AddLinkArticleToArticle < ActiveRecord::Migration
  def change
    add_column :articles, :link_article, :boolean
  end
end
