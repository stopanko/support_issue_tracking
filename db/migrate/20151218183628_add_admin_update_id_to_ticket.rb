class AddAdminUpdateIdToTicket < ActiveRecord::Migration
  def change
    add_column :tickets, :admin_update_id, :integer, default: nil
  end
end
