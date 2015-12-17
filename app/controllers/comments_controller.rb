class CommentsController < ApplicationController
  respond_to :html
  before_action :get_ticket, only: [:create]


  def create
    @comment = @ticket.comments.new(comment_params)
    if @comment.save
      flash[:notice] = "Commented"
      redirect_to ticket_path(@ticket.id)
    else
      flash.now[:alert] = @comment.errors.full_messages.join(", ")
      render 'tickets/show'
    end
  end


  private


  def comment_params
    params.require(:comment).permit(:text, :commentable_type, :commentable_id)
  end

end
