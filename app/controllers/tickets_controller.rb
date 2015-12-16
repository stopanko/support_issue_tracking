class TicketsController < ApplicationController
  respond_to :html

  def index

  end

  def new
    @ticket = Ticket.new
  end

  def create
    @ticket = Ticket.new(ticket_params)
    if @ticket.save
      flash[:notice] = "Saved successfully"
    else
      flash.now[:alert] = @ticket.errors.full_messages.join(", ")
      render :new
    end
  end


  private

  def ticket_params
    params.require(:ticket).permit(:user_name, :email, :title, :text, :problem_type_id, :status_id)
  end

end
