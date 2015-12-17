class Ticket < ActiveRecord::Base
  before_create :set_default_status
  validates_presence_of :user_name, :email, :title, :text, :problem_type_id, :status_id
  belongs_to :problem_type
  belongs_to :status

  scope :user_tickets, ->(user_email) {where(email: user_email)}

  has_many :comments, as: :commentable

  accepts_nested_attributes_for :comments

  def set_default_status
    self.status_id = Status.costumer_default.first.id
  end
end
