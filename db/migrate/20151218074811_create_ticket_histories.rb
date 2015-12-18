class CreateTicketHistories < ActiveRecord::Migration
  def change
    create_table :ticket_histories do |t|
      t.integer :ticket_id
      t.string :action_name
      t.integer :admin_user_id
      t.timestamps null: false
    end
  end
end
