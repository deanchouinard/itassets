class CreateTapes < ActiveRecord::Migration
  def self.up
    create_table :tapes do |t|
      t.string :label, :limit => 20

      t.timestamps
    end
  end

  def self.down
    drop_table :tapes
  end
end
