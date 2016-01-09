class ProblemType < ActiveRecord::Base
  validates :name, :presence => true, length: {minimum: 5}

  scope :active_problem_types, -> {where(active: true)}

  has_many :tickets
end
