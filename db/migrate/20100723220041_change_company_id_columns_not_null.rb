class ChangeCompanyIdColumnsNotNull < ActiveRecord::Migration
  def self.up
    change_column :computers, :company_id, :integer, :null => false
    change_column :softwares, :company_id, :integer, :null => false
  end

  def self.down
  end
end
