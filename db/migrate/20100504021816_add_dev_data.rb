class AddDevData < ActiveRecord::Migration
  def self.up
    User.delete_all
    User.create(:name => 'Alex', :password => 'grey',
                :password_confirmation => 'grey', :admin => true)

    User.create(:name => 'joe', :password => 'test',
                :password_confirmation => 'test', :admin => false)

    Site.delete_all
    Site.create(:code => 'DEFAULT', :address1 => '2 Park Place',
                :city => 'Boston', :state => 'MA', :zipcode => '02777')

  	Company.delete_all
   	Company.create(:code => 'CM', :description => 'Cat Mountain')
  	Company.create(:code => 'MF', :description => 'Mindfire')

    company = Company.find(:first, :condition => "code = 'CM'")
    site = Site.find(:first, :condition => "code ='DEFAULT'")
    
    Office.delete_all
    Office.create(:code => 'MAIN', :description => 'Main Office',
                  :company_id => company.id, :site_id => site.id)

    Lookups.delete_all
    Lookups.create(:lu_key => 'COMPUTERMANF', :lu_value => 'Lenovo',
                   :lu_active => true)
    Lookups.create(:lu_key => 'COMPUTERMANF', :lu_value => 'HP',
                   :lu_active => true)
    Lookups.create(:lu_key => 'COMPUTERMANF', :lu_value => 'Toshiba',
                   :lu_active => true)
    Lookups.create(:lu_key => 'COMPUTERTYPE', :lu_value => 'Desktop',
                   :lu_active => true)
    Lookups.create(:lu_key => 'COMPUTERTYPE', :lu_value => 'Laptop',
                   :lu_active => true)
    Lookups.create(:lu_key => 'COMPUTERTYPE', :lu_value => 'Server',
                   :lu_active => true)
    Lookups.create(:lu_key => 'COMPUTEROS', :lu_value => 'Windows XP',
                   :lu_active => true)
    Lookups.create(:lu_key => 'COMPUTEROS', :lu_value => 'Windows Server 2003',
                   :lu_active => true)
    Lookups.create(:lu_key => 'COMPUTEROS', :lu_value => 'Linux',
                   :lu_active => true)

    Computers.delete_all
    Computers.create(:manufacturer => 'Lenovo', model => 'Thinkpad T61',
                     :form_type => 'Laptop', :os => 'Windows XP')

    computer = Computers.find(:first)
    user = Users.find(:first, :conditions => "name = 'joe'")
    
    ComputerAllocations.delete_all
    ComputerAllocations.create(:computer_id => computer.id, :user_id => user.id,
                               :allocated => Time.now) 
  end

  def self.down
    User.delete_all
    Site.delete_all
    Company.delete_all
    Office.delete_all
    Lookups.delete_all
    Computers.delete_all
    ComputerAllocations.delete_all
  end
end
