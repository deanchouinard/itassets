class AddSoftwareIdToSoftwareAllocation < ActiveRecord::Migration
  def self.up
    add_column :software_allocations, :software_id, :integer
  end

  def self.down
    remove_column :software_allocations, :software_id
  end
end
