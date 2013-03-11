# == Schema Information
# Schema version: 20101209190403
#
# Table name: computer_allocations
#
#  id            :integer         not null, primary key
#  computer_id   :integer         not null
#  user_id       :integer         not null
#  allocated     :date
#  returned      :date
#  comments      :text
#  created_at    :datetime
#  updated_at    :datetime
#  computer_name :string(20)
#

class ComputerAllocation < ActiveRecord::Base
	belongs_to :computer
	belongs_to :user
	belongs_to :office

  def self.load_sel_list
    ComputerAllocation.find(:all).map {|ca| ["#{ca.computer.manufacturer} #{ca.computer.form_type} #{ca.computer.os}", ca.id]}
  end

  def self.display_str(id)
    ca = self.find(id)
    "#{ca.computer.manufacturer} #{ca.computer.model} #{ca.computer.serial_number}"
  end
  
end
