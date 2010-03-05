class AddTestData < ActiveRecord::Migration
  def self.up
  	Company.delete_all
  	Company.create(:code => 'CM', :description => 'Cat Mountain')
  	Company.create(:code => 'MF', :description => 'Mindfire')
  end

  def self.down
  	Company.delete_all
  end
end
