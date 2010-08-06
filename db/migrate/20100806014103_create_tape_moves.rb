class CreateTapeMoves < ActiveRecord::Migration
  def self.up
    create_table :tape_moves do |t|
      t.integer :tape_id
      t.string :destination, :limit => 40
      t.date :out
      t.date :return
      t.text :notes

      t.timestamps
    end
  end

  def self.down
    drop_table :tape_moves
  end
end
