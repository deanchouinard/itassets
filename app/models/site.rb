# == Schema Information
# Schema version: 20101209190403
#
# Table name: sites
#
#  id         :integer         not null, primary key
#  code       :string(8)
#  address1   :string(80)
#  address2   :string(80)
#  city       :string(30)
#  state      :string(2)
#  zipcode    :string(10)
#  created_at :datetime
#  updated_at :datetime
#

class Site < ActiveRecord::Base
  belongs_to :user
	
	#has_many :offices
	#has_many :companies, :through => :offices
	
	attr_accessible :code, :address1, :address2, :city, :state, :zipcode
	
	validates :code, :presence => true,
	                 :length => { :maximum => 8 },
	                 :uniqueness => true
	                 
	validates :address1, :city, :state, :zipcode, :presence => true
	
	def self.load_sel_list
		self.find(:all).map { |si| ["#{si.code} | #{si.address1}, #{si.city}, #{si.state}", si.id] }
	end
end
