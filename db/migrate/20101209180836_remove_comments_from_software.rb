class RemoveCommentsFromSoftware < ActiveRecord::Migration
  def self.up
    remove_column :softwares, :comments
    remove_column :softwares, :purchase_date
    remove_column :softwares, :company_id
  end

  def self.down
    add_column :softwares, :comments, :text
    add_column :softwares, :purchase_date, :date
    add_column :softwares, :company_id, :integer
  end
end
