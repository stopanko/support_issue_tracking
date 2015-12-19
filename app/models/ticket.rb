class Ticket < ActiveRecord::Base
  before_validation :set_default_status, on: :create
  before_save :set_ticket_history
  validates_presence_of :user_name, :email, :title, :text, :problem_type_id, :status_id
  belongs_to :problem_type
  belongs_to :status
  belongs_to :admin_user



  scope :user_tickets, ->(user_email) {where(email: user_email)}
  scope :all_tickets, -> {}

  has_many :comments, as: :commentable, dependent: :destroy
  has_many :ticket_histories, dependent: :destroy

  accepts_nested_attributes_for :comments, :allow_destroy => true

  # Status.all.each do |status|
  #   scope status.name.to_sym, ->{where(status_id: status.id)}
  # end
  #
  # ProblemType.all.each do |type|
  #   scope type.name.to_sym, ->{where(problem_type_id: type.id)}
  # end


  def get_histories
    self.ticket_histories.order(created_at: :desc)
  end

  private
  def set_ticket_history
    if self.new_record?
      self.ticket_histories.new(action_name: "create ticket", admin_user_id: self.admin_update_id ? self.admin_update_id : nil)
    else
      self.ticket_histories.new(action_name: "edit ticket", admin_user_id: self.admin_update_id ? self.admin_update_id : nil) if self.changed?
    end
  end

  def set_default_status
    self.status_id = Status.costumer_default.first.id
  end
end
