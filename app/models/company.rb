class Company < ActiveRecord::Base
	has_many :offices
	has_many :sites, :through => :offices
	
	validates_presence_of :code, :description
	validates_uniqueness_of :code
	
end
