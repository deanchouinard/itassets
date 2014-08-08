# == Schema Information
#
# Table name: ticket_actions
#
#  id          :integer          not null, primary key
#  ticket_id   :integer
#  add_user_id :integer
#  action_desc :text
#  created_at  :datetime
#  updated_at  :datetime
#

class TicketAction < ActiveRecord::Base
  belongs_to :tickets
end
