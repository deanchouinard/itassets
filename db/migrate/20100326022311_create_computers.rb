class CreateComputers < ActiveRecord::Migration
  def self.up
    create_table :computers do |t|
      t.string :manufacturer, :limit => 40, :null => false
      t.string :model, :limit => 40
      t.string :description
      t.string :type, :limit => 20, :null => false
      t.string :serial_number, :limit => 40
      t.string :cpu, :limit => 20
      t.string :ram, :limit => 10
      t.string :hdd, :limit => 10
      t.string :optical, :limit => 20
      t.string :os, :limit => 20, :null => false
      t.string :service_tag, :limit => 20
      t.date :purchase_date
      t.text :comments

      t.timestamps
    end
  end

  def self.down
    drop_table :computers
  end
end
