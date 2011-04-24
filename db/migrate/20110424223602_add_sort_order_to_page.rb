class AddSortOrderToPage < ActiveRecord::Migration
  def self.up
    add_column :pages, :sort_order, :integer, :default => 0
  end

  def self.down
    remove_column :pages, :sort_order
  end
end
