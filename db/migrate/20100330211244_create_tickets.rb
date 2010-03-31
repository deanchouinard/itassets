class CreateTickets < ActiveRecord::Migration
  def self.up
    create_table :tickets do |t|
      t.integer :computer_allocation_id
      t.integer :add_user_id
      t.string :ticket_type, :limit => 20
      t.string :contact_name, :limit => 40
      t.string :contact_phone, :limit => 15
      t.string :contact_email, :limit => 40
      t.text :ticket_desc
      t.date :release_date

      t.timestamps
    end
  end

  def self.down
    drop_table :tickets
  end
end
