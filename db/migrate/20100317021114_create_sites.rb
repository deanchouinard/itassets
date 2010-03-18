class CreateSites < ActiveRecord::Migration
  def self.up
    create_table :sites do |t|
      t.string :code, :limit => 8
      t.string :address1, :limit => 80
      t.string :address2, :limit => 80
      t.string :city, :limit => 30
      t.string :state, :limit => 2
      t.string :zipcode, :limit => 10

      t.timestamps
    end
  end

  def self.down
    drop_table :sites
  end
end
