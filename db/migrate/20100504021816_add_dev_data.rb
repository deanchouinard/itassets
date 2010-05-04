class AddDevData < ActiveRecord::Migration
  def self.up
    User.delete_all
    User.create(:name => 'Alex', :password => 'grey',
                :password_confirmation => 'grey')

    Site.delete_all
    Site.create(:code => 'DEFAULT', :address1 => '2 Park Place',
                :city => 'Boston', :state => 'MA', :zipcode => '02777')
    
  end

  def self.down
    User.delete_all
    Site.delete_all
    
  end
end
