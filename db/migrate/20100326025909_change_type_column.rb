class ChangeTypeColumn < ActiveRecord::Migration
  def self.up
		rename_column :computers, :type, :form_type 
  end

  def self.down
  end
end
