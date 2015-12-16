class Ticket < ActiveRecord::Base
  before_validation :set_default_status
  validates_presence_of :user_name, :email, :title, :text, :problem_type_id, :status_id


  def set_default_status
    self.status_id = Status.costumer_default.first.id
  end
end
