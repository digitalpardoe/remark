class RemoveParentFromAddHiddenToPage < ActiveRecord::Migration
  def self.up
    remove_column :pages, :page_id
    add_column :pages, :hidden, :boolean, :default => false
  end

  def self.down
    add_column :pages, :page_id, :integer
    remove_column :pages, :hidden
  end
end
