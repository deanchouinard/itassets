# == Schema Information
#
# Table name: tickets
#
#  id                     :integer          not null, primary key
#  computer_allocation_id :integer
#  add_user_id            :integer
#  ticket_type            :string(20)
#  contact_name           :string(40)
#  contact_phone          :string(15)
#  contact_email          :string(40)
#  ticket_desc            :text
#  release_date           :date
#  created_at             :datetime
#  updated_at             :datetime
#

class Ticket < ActiveRecord::Base
  has_many :ticket_actions

  def self.display_str(id)
    @ticket = self.find(id)
    @computer_allocation_display_str = ComputerAllocation.display_str(@ticket.computer_allocation_id)
    "#{ @computer_allocation_display_str} #{@ticket.contact_name} #{@ticket.ticket_type}"
  end
end
