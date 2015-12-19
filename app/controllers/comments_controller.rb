class CommentsController < ApplicationController
  respond_to :html
  before_action :get_ticket, only: [:create, :get_next_ticket_comments]


  def create
    @comment = @ticket.comments.new(comment_params)
    if @comment.save
      flash[:notice] = "Commented"
      redirect_to ticket_path(@ticket.id)
    else
      flash[:alert] = @comment.errors.full_messages.join(", ")
      redirect_to ticket_path(@ticket.id)
    end
  end

  def get_next_ticket_comments
    @next_ticket_comments = @ticket.comments.order(created_at: :desc).offset(params[:comments_count]).limit(5)
    p "@next_ticket_comments"
    p @next_ticket_comments
    respond_to :js
  end

  def update
    @comment = Comment.find(params[:id])
    if @comment.update_attributes(comment_params)

    else
      @errors = @comment.errors.full_messages
    end
    respond_to :js
  end


  private


  def comment_params
    params.require(:comment).permit(:text, :commentable_type, :commentable_id, :admin_user_id)
  end

end
