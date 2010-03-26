class CreateLookups < ActiveRecord::Migration
  def self.up
    create_table :lookups do |t|
      t.string :lu_key, :limit => 80, :null => false
      t.string :lu_value, :limit => 80, :null => false
      t.boolean :lu_active, :default => true

      t.timestamps
    end
		
		add_index :lookups, :lu_key
		
  end

  def self.down
    drop_table :lookups
  end
end
