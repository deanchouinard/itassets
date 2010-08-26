class Site < ActiveRecord::Base
	has_many :offices
	has_many :companies, :through => :offices
	
	def self.load_sel_list
		self.find(:all).map { |si| ["#{si.code} | #{si.address1}, #{si.city}, #{si.state}", si.id] }
	end
end
