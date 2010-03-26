class AddFieldsToUser < ActiveRecord::Migration
  def self.up
    add_column :users, :first_name, :string, :limit => 40
    add_column :users, :last_name, :string, :limit => 40
    add_column :users, :email, :string, :limit => 40
  end

  def self.down
    remove_column :users, :email
    remove_column :users, :last_name
    remove_column :users, :first_name
  end
end
