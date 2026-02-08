class AddLinkArticleToArticle < ActiveRecord::Migration[6.1]
  def change
    add_column :articles, :link_article, :boolean
  end
end
