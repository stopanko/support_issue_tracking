class TicketHistory < ActiveRecord::Base
  validates_presence_of :ticket_id, :action_name


  belongs_to :admin_user
  belongs_to :ticket
end
