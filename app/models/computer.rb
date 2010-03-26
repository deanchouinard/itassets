class Computer < ActiveRecord::Base
	has_many :computer_allocations
	has_many :users, :through => :computer_allocations
	
	def self.load_sel_list
		self.find(:all).map { |co|
			[co.manufacturer.strip + " " +
			 co.form_type.strip + " " +
			 co.os.strip, co.id]}
	end
end
