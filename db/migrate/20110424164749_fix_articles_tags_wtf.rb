class FixArticlesTagsWtf < ActiveRecord::Migration
  def self.up
    drop_table :articles_tags
    
    create_table :articles_tags, :id => false do |t|
      t.integer :article_id
      t.integer :tag_id
    end

    add_index :articles_tags, [:article_id, :tag_id]
  end

  def self.down
    drop_table :articles_tags
    
    create_table :articles_tags, :id => false do |t|
      t.string :article_id
      t.boolean :tag_id
    end

    add_index :articles_tags, [:article_id, :tag_id]
  end
end
