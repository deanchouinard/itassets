class CreateOffices < ActiveRecord::Migration
  def self.up
    create_table :offices do |t|
      t.string :code, :limit => 16
      t.string :description
      t.integer :company_id
      t.integer :site_id

      t.timestamps
    end
  end

  def self.down
    drop_table :offices
  end
end
