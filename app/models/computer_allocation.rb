class ComputerAllocation < ActiveRecord::Base
	belongs_to :computer
	belongs_to :user

  def self.load_sel_list
    ComputerAllocation.find(:all).map {|ca| ["#{ca.computer.manufacturer} #{ca.computer.form_type} #{ca.computer.os}", ca.id]}
  end

  def self.display_str(id)
    ca = self.find(id)
    "#{ca.computer.manufacturer} #{ca.computer.model} #{ca.computer.serial_number}"
  end
  
end
