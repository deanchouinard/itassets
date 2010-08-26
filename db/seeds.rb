# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#   
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Major.create(:name => 'Daley', :city => cities.first)

    Site.delete_all
    Site.create(:code => 'DEFAULT', :address1 => '2 Park Place',
                :address2 => 'Suite 204',
                :city => 'Boston', :state => 'MA', :zipcode => '02777')

  	Company.delete_all
   	Company.create(:code => 'CM', :description => 'Cat Mountain')
  	Company.create(:code => 'MF', :description => 'Mindfire')

    company = Company.find(:first, :conditions => "code = 'CM'")
    site = Site.find(:first, :conditions => "code ='DEFAULT'")
    
    Office.delete_all
    Office.create(:code => 'MAIN', :description => 'Main Office',
                  :company_id => company.id, :site_id => site.id)

    office = Office.find(:first)
    User.delete_all
    User.create(:name => 'Alex', :password => 'grey',
                :password_confirmation => 'grey', :admin => true,
                :first_name => 'Alexander', :last_name => 'Grey',
                :email => 'alex@test.com', :office_id => office.id)

    User.create(:name => 'joe', :password => 'test',
                :password_confirmation => 'test', :admin => false,
                :first_name => 'Joe', :last_name => 'Cool',
                :email => 'joe@cool.com', :office_id => office.id)

    Lookup.delete_all
    Lookup.create(:lu_key => 'COMPUTERMANF', :lu_value => 'Lenovo',
                  :lu_active => true)
    Lookup.create(:lu_key => 'COMPUTERMANF', :lu_value => 'HP',
                  :lu_active => true)
    Lookup.create(:lu_key => 'COMPUTERMANF', :lu_value => 'Toshiba',
                  :lu_active => true)
    Lookup.create(:lu_key => 'COMPUTERTYPE', :lu_value => 'Desktop',
                  :lu_active => true)
    Lookup.create(:lu_key => 'COMPUTERTYPE', :lu_value => 'Laptop',
                  :lu_active => true)
    Lookup.create(:lu_key => 'COMPUTERTYPE', :lu_value => 'Server',
                  :lu_active => true)
    Lookup.create(:lu_key => 'COMPUTEROS', :lu_value => 'Windows XP',
                  :lu_active => true)
    Lookup.create(:lu_key => 'COMPUTEROS', :lu_value => 'Windows Server 2003',
                  :lu_active => true)
    Lookup.create(:lu_key => 'COMPUTEROS', :lu_value => 'Linux',
                  :lu_active => true)
    Lookup.create(:lu_key => 'SOFTPUB', :lu_value => 'Microsoft',
                  :lu_active => true)
    Lookup.create(:lu_key => 'SOFTPUB', :lu_value => 'Adobe',
                  :lu_active => true)
    Lookup.create(:lu_key => 'TICKETTYPE', :lu_value => 'Hardware',
                  :lu_active => true)
    Lookup.create(:lu_key => 'TICKETTYPE', :lu_value => 'Software',
                  :lu_active => true)
    Lookup.create(:lu_key => 'TICKETTYPE', :lu_value => 'Misc',
                  :lu_active => true)
    Lookup.create(:lu_key => 'TAPEDEST', :lu_value => 'IM Boston',
                  :lu_active => true)

    company = Company.find(:first)
    Computer.delete_all
    Computer.create(:manufacturer => 'Lenovo', :model => 'Thinkpad T61',
                    :description => 'Standard laptop setup',
                    :form_type => 'Laptop', :serial_number => 'WP876FFDDS3D4',
                    :cpu => '2.4 GHz', :ram => '2GB', :hdd => '250GB',
                    :optical => 'DVD R/W', :os => 'Windows XP',
                    :service_tag => 'IS201028', :purchase_date => Time.now,
                    :comments => 'No comments', :company_id => company.id)

    computer = Computer.find(:first)
    user = User.find(:first, :conditions => "name = 'joe'")
    
    ComputerAllocation.delete_all
    ComputerAllocation.create(:computer_id => computer.id, :user_id => user.id,
                              :allocated => Time.now, :returned => NIL,
                              :comments => 'First allocation', :computer_name => "BOS-ACC-01") 

    Software.delete_all
    Software.create(:publisher => 'Microsoft', :title_version => 'Office 2003 Standard',
                    :purchase_date => Time.now, :company_id => company.id)

    computer_allocation = ComputerAllocation.find(:first)
    
    Ticket.delete_all
    Ticket.create(:computer_allocation_id => computer_allocation.id, :add_user_id => user.id,
                  :ticket_type => 'Hardware', :contact_name => 'Bill Nope',
                  :contact_phone => '5085554569', :contact_email => 'bndon@test.com',
                  :ticket_desc => "Can't find on switch", :release_date => NIL)

    ticket = Ticket.find(:first)

    TicketAction.delete_all
    TicketAction.create(:ticket_id => ticket.id, :add_user_id => ticket.add_user_id,
                        :action_desc => "Turned computer on")
    
    Tape.delete_all
    Tape.create(:label => "I0700")
    Tape.create(:label => "I0800")
    
    TapeMove.delete_all
    tape = Tape.find(:first)
    TapeMove.create(:tape_id => tape.id, :destination => "IM Boston", :out => Time.now,
                    :notes => "First move")
