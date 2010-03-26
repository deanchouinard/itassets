class ComputerAllocation < ActiveRecord::Base
	belongs_to :computer
	belongs_to :user
end
