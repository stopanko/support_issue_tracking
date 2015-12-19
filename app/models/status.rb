class Status < ActiveRecord::Base

  before_save :uncheck_other_defaults_statuses_flags

  scope :active_statuses, -> {where(active: true)}

  scope :costumer_default, -> {where(costumer_default: true)}
  scope :admin_default, -> {where(admin_default: true)}

  has_many :tickets


  private

  def uncheck_other_defaults_statuses_flags
    if self.admin_default.present?
      Status.where.not(id: self.id).update_all(admin_default: false)
    end
    if self.costumer_default.present?
      Status.where.not(id: self.id).update_all(costumer_default: false)
    end
  end

end
