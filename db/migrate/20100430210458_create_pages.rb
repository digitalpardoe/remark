class CreatePages < ActiveRecord::Migration
  def self.up
    create_table :pages do |t|
      t.string :title
      t.text :body
      t.integer :user_id
      t.string :permalink
      t.boolean :draft, :default => false
      t.datetime :published
      t.integer :page_id

      t.timestamps
    end
  end

  def self.down
    drop_table :pages
  end
end
