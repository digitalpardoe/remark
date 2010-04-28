class CreateArticles < ActiveRecord::Migration
  def self.up
    create_table :articles do |t|
      t.string :title
      t.text :body
      t.integer :user_id
      t.text :excerpt
      t.string :permalink
      t.string :uuid
      t.boolean :draft, :default => true
      t.datetime :published

      t.timestamps
    end
  end

  def self.down
    drop_table :articles
  end
end
