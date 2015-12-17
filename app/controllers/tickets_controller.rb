class TicketsController < ApplicationController
  respond_to :html

  before_action :get_ticket, only: [:show]
  before_action :get_user_tickets, only: [:index]

  def index
    add_breadcrumb 'Dashboard', :tickets_path, prepend: '<i class="fa fa-dashboard"></i> '
  end

  def new
    add_breadcrumb 'Create ticket', :new_ticket_path, prepend: '<i class="fa fa-edit"></i> '
    @ticket = Ticket.new
  end

  def show
    @comment = @ticket.comments.new
    @comments = @ticket.comments
  end

  def create
    @ticket = Ticket.new(ticket_params)
    if @ticket.save
      flash[:notice] = "Saved successfully"
      redirect_to ticket_path(@ticket.id)
    else
      flash.now[:alert] = @ticket.errors.full_messages.join(", ")
      render :new
    end
  end


  private

  def ticket_params
    params.require(:ticket).permit(:user_name, :email, :title, :text, :problem_type_id, :status_id)
  end

  def get_user_tickets
    @tickets = Ticket.user_tickets(params[:email]).paginate(page: params[:page], per_page: 10) if params[:email]
    get_last_tickets_comments
  end

  def get_last_tickets_comments
    # @last_comments = Comment.where(commentable_type: "Ticket", commentable_id: @tickets.pluck(:id)).last(5) if params[:email]
    @last_comments = @tickets.each.map{|ticket| ticket.comments.last }.compact if params[:email]
    p "@last_comments"
    p @last_comments
  end



end
