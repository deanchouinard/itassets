# == Schema Information
# Schema version: 20101209190403
#
# Table name: software_allocations
#
#  id            :integer         not null, primary key
#  user_id       :integer
#  purchase_date :date
#  comments      :text
#  created_at    :datetime
#  updated_at    :datetime
#  software_id   :integer
#

class SoftwareAllocation < ActiveRecord::Base
  belongs_to :software
  belongs_to :user
end
