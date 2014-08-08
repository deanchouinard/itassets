# == Schema Information
#
# Table name: tape_moves
#
#  id          :integer          not null, primary key
#  tape_id     :integer
#  destination :string(40)
#  out         :date
#  return      :date
#  notes       :text
#  created_at  :datetime
#  updated_at  :datetime
#

class TapeMove < ActiveRecord::Base
  belongs_to :tape
end
