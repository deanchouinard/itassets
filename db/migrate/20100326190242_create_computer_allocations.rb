class CreateComputerAllocations < ActiveRecord::Migration
  def self.up
    create_table :computer_allocations do |t|
      t.integer :computer_id, :null => false
      t.integer :user_id, :null => false
      t.date :allocated
      t.date :returned
      t.text :comments

      t.timestamps
    end
  end

  def self.down
    drop_table :computer_allocations
  end
end
