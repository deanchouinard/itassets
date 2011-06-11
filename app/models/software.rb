# == Schema Information
# Schema version: 20101209190403
#
# Table name: softwares
#
#  id            :integer         not null, primary key
#  publisher     :string(80)      not null
#  title_version :string(80)      not null
#  created_at    :datetime
#  updated_at    :datetime
#

class Software < ActiveRecord::Base
  has_many :software_allocations
  has_many :users, :through => :software_allocations
  
  def self.load_sel_list
    self.find(:all).map {|so| ["#{so.publisher} #{so.title_version}", so.id]}
  end
  
  
  
end
