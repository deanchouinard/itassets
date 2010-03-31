class Ticket < ActiveRecord::Base
  has_many :ticket_actions
end
