class AddComputerNameToComputerAllocation < ActiveRecord::Migration
  def self.up
    add_column :computer_allocations, :computer_name, :string, :limit => 20
  end

  def self.down
    remove_column :computer_allocations, :computer_name
  end
end
