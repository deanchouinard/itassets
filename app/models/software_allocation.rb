class SoftwareAllocation < ActiveRecord::Base
  belongs_to :software
  belongs_to :user
end
