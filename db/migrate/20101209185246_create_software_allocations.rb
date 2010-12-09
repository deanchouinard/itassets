class CreateSoftwareAllocations < ActiveRecord::Migration
  def self.up
    create_table :software_allocations do |t|
      t.integer :user_id
      t.date :purchase_date
      t.text :comments

      t.timestamps
    end
  end

  def self.down
    drop_table :software_allocations
  end
end
