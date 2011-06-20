class FixPwColumn < ActiveRecord::Migration
  def self.up
    rename_column :users, :hashed_password, :encrypted_password
  end

  def self.down
  end
end
