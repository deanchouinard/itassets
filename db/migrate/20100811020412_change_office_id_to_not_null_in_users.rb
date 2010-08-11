class ChangeOfficeIdToNotNullInUsers < ActiveRecord::Migration
  def self.up
    change_column :users, :office_id, :integer, :null => false
  end

  def self.down
  end
end
