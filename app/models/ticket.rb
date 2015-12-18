class Ticket < ActiveRecord::Base
  before_validation :set_default_status, on: :create
  before_save :set_ticket_history
  validates_presence_of :user_name, :email, :title, :text, :problem_type_id, :status_id
  belongs_to :problem_type
  belongs_to :status

  scope :user_tickets, ->(user_email) {where(email: user_email)}

  has_many :comments, as: :commentable
  has_many :ticket_histories

  accepts_nested_attributes_for :comments


  def get_histories
    self.ticket_histories.order(created_at: :desc)
  end

  private
  def set_ticket_history
    if self.new_record?
      self.ticket_histories.new(action_name: "create ticket")
    else
      self.ticket_histories.new(action_name: "edit ticket")
    end
  end

  def set_default_status
    self.status_id = Status.costumer_default.first.id
  end
end
