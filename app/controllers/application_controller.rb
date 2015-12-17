class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  helper_method :get_ticket
  protect_from_forgery with: :exception

  private
  def get_ticket
    @ticket = Ticket.find(params[:id])
    get_ticket_comments
  end

  def get_ticket_comments
    @comments = @ticket.comments
  end
end
