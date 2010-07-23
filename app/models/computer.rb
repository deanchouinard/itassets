class Computer < ActiveRecord::Base
	has_many :computer_allocations
	has_many :users, :through => :computer_allocations
	belongs_to :company
	
	def self.load_sel_list
		self.find(:all).map { |co|
			[co.manufacturer.strip + " " +
			 co.form_type.strip + " " +
			 co.os.strip, co.id]}
	end
	
	def self.display_str( id )
	  co = self.find(id)
    "#{co.manufacturer} #{co.form_type} (#{co.os})"  
  end
end
