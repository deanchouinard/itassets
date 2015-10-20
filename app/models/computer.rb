# == Schema Information
#
# Table name: computers
#
#  id            :integer          not null, primary key
#  manufacturer  :string(40)       not null
#  model         :string(40)
#  description   :string(255)
#  form_type     :string(20)       not null
#  serial_number :string(40)
#  cpu           :string(20)
#  ram           :string(10)
#  hdd           :string(10)
#  optical       :string(20)
#  os            :string(20)       not null
#  service_tag   :string(20)
#  purchase_date :date
#  comments      :text
#  created_at    :datetime
#  updated_at    :datetime
#  company_id    :integer          not null
#  manf_type     :string(20)
#

class Computer < ActiveRecord::Base
	has_many :computer_allocations
	has_many :users, :through => :computer_allocations
	belongs_to :company
	
	def self.load_sel_list
		self.find_each.map { |co|
			[co.manufacturer.strip + " " +
			 co.model.strip + " " +
			 co.serial_number.strip, co.id]}
	end
	
	def self.display_str( id )
	  co = self.find(id)
    "#{co.manufacturer} #{co.model} (#{co.serial_number})"  
  end

  
end
