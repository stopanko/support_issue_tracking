class CreateTickets < ActiveRecord::Migration
  def change
    create_table :tickets do |t|
      t.string :email
      t.string :user_name
      t.string :title
      t.text :text
      t.integer :problem_type_id
      t.integer :status_id
      t.timestamps null: false
    end
  end
end
