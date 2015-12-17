class TicketsController < ApplicationController
  respond_to :html

  before_action :get_ticket, only: [:show]
  before_action :get_user_tickets, only: [:index]

  def index

  end

  def new
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
    @tickets = Ticket.user_tickets(params[:email]).paginate(page: params[:page], per_page: 2) if params[:email]
    get_last_tickets_comments
  end

  def get_last_tickets_comments
    @last_comments = Comment.where(commentable_type: "Ticket", commentable_id: @tickets.pluck(:id)).last(5) if params[:email]
  end



end
