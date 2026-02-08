class AddWebsiteToUser < ActiveRecord::Migration[6.1]
  def self.up
    add_column :users, :website, :string
  end

  def self.down
    remove_column :users, :website
  end
end
