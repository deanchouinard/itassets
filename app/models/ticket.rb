class Ticket < ActiveRecord::Base
  has_many :ticket_actions

  def self.display_str(id)
    @ticket = self.find(id)
    @computer_allocation_display_str = ComputerAllocation.display_str(@ticket.computer_allocation_id)
    "#{ @computer_allocation_display_str} #{@ticket.contact_name} #{@ticket.ticket_type}"
  end
end
