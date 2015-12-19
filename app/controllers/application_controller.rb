class ApplicationController < ActionController::Base
  add_breadcrumb 'Home', :root_path, prepend: '<i class="fa fa-desktop"></i> '
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  helper_method :get_ticket
  helper_method :email_param
  helper_method :add_dashboard_breadcrumb
  protect_from_forgery with: :exception

  private
  def get_ticket
    @ticket = Ticket.find(params[:id])
    get_ticket_comments
  end

  def get_ticket_comments
    @comments = @ticket.comments
  end

  def email_param
    params[:email].gsub(".", "_") if params[:email]
  end

  def add_dashboard_breadcrumb
    add_breadcrumb 'Dashboard', tickets_path(email: params[:email]), prepend: '<i class="fa fa-dashboard"></i> '
  end

end
