class CreateProblemTypes < ActiveRecord::Migration
  def change
    create_table :problem_types do |t|
      t.string :name
      t.string :color
      t.boolean :active, default: true
      t.timestamps null: false
    end
  end
end
