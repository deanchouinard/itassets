class CreateSoftwares < ActiveRecord::Migration
  def self.up
    create_table :softwares do |t|
      t.string :publisher, :limit => 80, :null => false
      t.string :title_version, :limit => 80, :null => false
      t.date :purchase_date
      t.text :comments

      t.timestamps
    end
		
		Software.create :publisher => "Microsoft", :title_version => "Office 2003 Standard"
		Software.create :publisher => "Microsoft", :title_version => "Office 2007 Standard"
		Software.create :publisher => "Adobe", :title_version => "Acrobat 9 Standard"
		
  end

  def self.down
    drop_table :softwares
  end
end
