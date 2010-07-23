class AddCompanyToComputer < ActiveRecord::Migration
  def self.up
    add_column :computers, :company_id, :integer
  end

  def self.down
    remove_column :computers, :company_id
  end
end
