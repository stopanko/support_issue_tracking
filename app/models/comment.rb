class Comment < ActiveRecord::Base
  before_save :set_ticket_status
  before_save :set_ticket_history
  validates_presence_of :text, :commentable_id, :commentable_type
  validates :text, length: {minimum: 1}
  belongs_to :commentable, polymorphic: true




  private

  def set_ticket_history
    if self.new_record?
      self.commentable.ticket_histories.create(action_name: "create comment")
    else
      self.commentable.ticket_histories.create(action_name: "edit comment")
    end
  end

  def set_ticket_status
    if self.admin_user_id
      self.commentable.update_attributes(status_id: Status.admin_default.first.id)
    else
      self.commentable.update_attributes(status_id: Status.costumer_default.first.id)
    end
  end


  # def add_to_history
end
