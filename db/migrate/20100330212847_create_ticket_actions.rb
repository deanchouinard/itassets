class CreateTicketActions < ActiveRecord::Migration
  def self.up
    create_table :ticket_actions do |t|
      t.integer :ticket_id
      t.integer :add_user_id
      t.text :action_desc

      t.timestamps
    end
  end

  def self.down
    drop_table :ticket_actions
  end
end
