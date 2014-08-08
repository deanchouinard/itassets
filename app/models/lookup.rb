# == Schema Information
#
# Table name: lookups
#
#  id         :integer          not null, primary key
#  lu_key     :string(80)       not null
#  lu_value   :string(80)       not null
#  lu_active  :boolean          default(TRUE)
#  created_at :datetime
#  updated_at :datetime
#

class Lookup < ActiveRecord::Base
  validates_presence_of :lu_key, :lu_value
  
	def self.get_lu_values(key)
		# the self.find works also with just find without the self
		self.find(:all, :select => "lu_value", 
	                              :conditions => ["lu_key = ?
	                              and lu_active = true", key]).map {|tl| tl.lu_value}
	end
		
  def self.get_lu_keys()
    self.find(:all, :select => "DISTINCT lu_key", :order => "lu_key ASC",
                                :conditions => ["lu_active = true"]).map {|tk| tk.lu_key}
    
  end
  
end
