class Ticket < ActiveRecord::Base
  before_create :set_default_status
  validates_presence_of :user_name, :email, :title, :text, :problem_type_id, :status_id


  private
  def set_default_status

  end
end
