class AdminMailer < ApplicationMailer
  default from: "support_issue_tracking@example.com"

  def new_ticket_created(ticket)
    @ticket = ticket
    @admins = AdminUser.all
    @admins.each do |admin|
      @admin = admin
      mail(to: admin.email, subject: 'New ticket created')
    end
  end


  def new_comment_created(comment)
    @comment = comment
    @admins = AdminUser.all
    @admins.each do |admin|
      @admin = admin
      mail(to: admin.email, subject: 'New comment created')
    end
  end

end
