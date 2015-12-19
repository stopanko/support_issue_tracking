class TicketsController < ApplicationController
  respond_to :html


  before_action :get_ticket, only: [:show, :edit, :update, :get_next_ticket_history]

  before_action :check_ticket_owner, only: [:show, :edit]

  before_action :get_user_tickets, only: [:index]

  def index
    add_dashboard_breadcrumb
  end

  def new
    add_dashboard_breadcrumb
    add_breadcrumb 'Create ticket', :new_ticket_path, prepend: '<i class="fa fa-edit"></i> '
    @ticket = Ticket.new
  end

  def show
    add_dashboard_breadcrumb
    add_breadcrumb 'Ticket', email_ticket_path(@ticket.id, email_param), prepend: '<i class="fa fa-user"></i> '
    add_breadcrumb 'Edit', edit_email_ticket_path(@ticket.id, email_param), prepend: '<i class="fa fa-edit"></i> '
    @comment = Comment.new
    @comments = @ticket.comments.order(created_at: :desc).limit(5)
    @ticket_histories = @ticket.get_histories.limit(5)
  end

  def create
    @ticket = Ticket.new(ticket_params)
    if @ticket.save
      flash[:notice] = "Saved successfully"
      AdminMailer.new_ticket_created(@ticket).deliver_later
      UserMailer.new_ticket_created(@ticket).deliver_later
      redirect_to email_ticket_path(@ticket.id, @ticket.email.gsub(".", "_"))
    else
      flash.now[:alert] = @ticket.errors.full_messages.join(", ")
      render :new
    end
  end


  def edit
    add_dashboard_breadcrumb
    add_breadcrumb 'Ticket', email_ticket_path(@ticket.id, email_param), prepend: '<i class="fa fa-user"></i> '
    add_breadcrumb 'Edit', edit_email_ticket_path(@ticket.id, email_param), prepend: '<i class="fa fa-edit"></i> '
  end


  def update
    if @ticket.update_attributes(ticket_params.merge!(admin_update_id: nil))
      flash[:notice] = "Updated successfully"
      redirect_to email_ticket_path(@ticket.id, @ticket.email.gsub(".", "_"))
    else
      flash.now[:alert] = @ticket.errors.full_messages.join(", ")
      render :edit
    end
  end

  def get_next_ticket_history
    @next_histories = @ticket.get_histories.offset(params[:history_count]).limit(5)
    respond_to :js
  end

  private

  def ticket_params
    params.require(:ticket).permit(:admin_update_id, :user_name, :email, :title, :text, :problem_type_id, :status_id)
  end

  def get_user_tickets
    @tickets = Ticket.user_tickets(params[:email].gsub("_", ".")).order(created_at: :desc).paginate(page: params[:page], per_page: 10) if params[:email]
    get_last_tickets_comments
  end

  def get_last_tickets_comments
    # @last_comments = Comment.where(commentable_type: "Ticket", commentable_id: @tickets.pluck(:id)).last(5) if params[:email]
    @last_comments = @tickets.each.map{|ticket| ticket.comments.last }.compact if params[:email]
    p "@last_comments"
    p @last_comments
  end

  def check_ticket_owner
    if @ticket.email.gsub(".", "_") != params[:email]
      render :file => "#{Rails.root}/public/404", :layout => false, :status => 404
    end
  end



end
