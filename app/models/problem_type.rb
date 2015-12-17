class ProblemType < ActiveRecord::Base

  scope :active_problem_types, -> {where(active: true)}

  has_many :tickets
end
