class AddUrlToArticle < ActiveRecord::Migration[6.1]
  def change
    add_column :articles, :url, :string
  end
end
