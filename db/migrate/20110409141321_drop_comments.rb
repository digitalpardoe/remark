class DropComments < ActiveRecord::Migration
  def self.up
    drop_table :comments
  end

  def self.down
    create_table :comments do |t|
      t.string :name
      t.string :email
      t.text :body
      t.string :website
      t.string :uuid
      t.boolean :spam, :default => true
      t.integer :article_id
      t.integer :user_id

      t.timestamps
    end
  end
end
