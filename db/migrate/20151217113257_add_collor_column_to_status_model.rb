class AddCollorColumnToStatusModel < ActiveRecord::Migration
  def change
    add_column :statuses, :color, :string, default: "#f9f9f9"
  end
end
