class Company < ActiveRecord::Base
	
	validates_presence_of :code, :description
	validates_uniqueness_of :code
	
end
