class UserMailer < ApplicationMailer
  default from: "support_issue_tracking@example.com"


  def new_ticket_created(ticket)
    @ticket = ticket
    mail(to: @ticket.email, subject: 'New ticket created')
  end

  def ticket_updated(ticket)
    @ticket = ticket
    mail(to: @ticket.email, subject: 'Ticket updated')
  end

end
