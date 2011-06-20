class RemoveOfficeNullConstraint < ActiveRecord::Migration
  def self.up
    change_column :users, :office_id, :integer, :null => true
  end

  def self.down
  end
end
