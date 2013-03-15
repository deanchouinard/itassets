# == Schema Information
# Schema version: 20101209190403
#
# Table name: companies
#
#  id          :integer         not null, primary key
#  code        :string(255)
#  description :string(255)
#  created_at  :datetime
#  updated_at  :datetime
#

class Company < ActiveRecord::Base
#	has_many :offices
#	has_many :sites, :through => :offices
#	has_many :computers

	belongs_to :user
	
	validates_presence_of :code, :description
	validates_uniqueness_of :code
	
  def self.load_sel_list( user_id )
    Company.where("user_id = ?", user_id).map {|co| ["#{co.code} | #{co.description}", co.id]}
  end

end
