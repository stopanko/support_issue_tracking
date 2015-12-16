class AddCostumerDefaultAndAdminDefaultFieldsForStatuser < ActiveRecord::Migration
  def change
    add_column :statuses, :costumer_default, :boolean, default: false
    add_column :statuses, :admin_default, :boolean, default: false
  end
end
