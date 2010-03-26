class Lookup < ActiveRecord::Base
		def self.get_lu_values(key)
			# the self.find works also with just find without the self
			self.find(:all, :select => "lu_value", 
		                              :conditions => ["lu_key = ?
		                              and lu_active = true", key]).map {|tl| tl.lu_value}
		end
		

end
