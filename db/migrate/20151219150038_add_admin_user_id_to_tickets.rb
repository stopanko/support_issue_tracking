class AddAdminUserIdToTickets < ActiveRecord::Migration
  def change
    add_column :tickets, :admin_user_id, :integer
  end
end
