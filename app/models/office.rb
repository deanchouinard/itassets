# == Schema Information
# Schema version: 20101209190403
#
# Table name: offices
#
#  id          :integer         not null, primary key
#  code        :string(16)
#  description :string(255)
#  company_id  :integer
#  site_id     :integer
#  created_at  :datetime
#  updated_at  :datetime
#

class Office < ActiveRecord::Base
	belongs_to :company
	belongs_to :site
	belongs_to :user
	
	def self.load_sel_list
    self.find(:all).map {|of| ["#{of.code} #{of.description} | #{of.company.description}, #{of.site.city},
    #{of.site.state}", of.id]}
  end

  def self.display_str(id)
    of = self.find(id)
    "#{of.description} #{of.company.description}"
  end
end
