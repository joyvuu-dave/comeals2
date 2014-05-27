class AddColumnsToMeal < ActiveRecord::Migration
  def change
    add_column :meals, :hidden, :boolean, null: false, default: false
    add_column :meals, :multiplier, :integer, null: false, default: 0
    add_column :meals, :total_cost, :integer, null: false, default: 0
    add_column :meals, :locked, :boolean, null: false, default: false
  end
end
