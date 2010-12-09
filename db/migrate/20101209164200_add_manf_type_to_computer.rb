class AddManfTypeToComputer < ActiveRecord::Migration
  def self.up
    add_column :computers, :manf_type, :string, :limit => 20
  end

  def self.down
    remove_column :computers, :manf_type
  end
end
