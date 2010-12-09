class Software < ActiveRecord::Base
  has_many :software_allocations
  has_many :users, :through => :software_allocations
  
  def self.load_sel_list
    self.find(:all).map {|so| ["#{so.publisher} #{so.title_version}", so.id]}
  end
  
  
  
end
