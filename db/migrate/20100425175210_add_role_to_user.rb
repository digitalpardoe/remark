class AddRoleToUser < ActiveRecord::Migration[6.1]
  def self.up
    add_column :users, :role_id, :integer
  end

  def self.down
    remove_column :users, :role_id
  end
end
