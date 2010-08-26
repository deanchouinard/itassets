class Company < ActiveRecord::Base
	has_many :offices
	has_many :sites, :through => :offices
	has_many :computers
	has_many :softwares
	
	validates_presence_of :code, :description
	validates_uniqueness_of :code
	
  def self.load_sel_list
    Company.find(:all).map {|co| ["#{co.code} | #{co.description}", co.id]}
  end

end
