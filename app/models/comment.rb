class Comment < ActiveRecord::Base
  before_save :set_ticket_status
  validates_presence_of :text, :commentable_id, :commentable_type
  validates :text, length: {minimum: 1}
  belongs_to :commentable, polymorphic: true


  def set_ticket_status
    if self.admin_user_id

    else
      self.commentable.update_attributes(status_id: Status.costumer_default.first.id)
    end
  end
end
