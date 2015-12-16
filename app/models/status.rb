class Status < ActiveRecord::Base

  scope :active_statuses, -> {where(active: true)}

  scope :costumer_default, -> {where(costumer_default: true)}
  scope :admin_default, -> {where(admin_default: true)}

end
