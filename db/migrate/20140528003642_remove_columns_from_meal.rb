class RemoveColumnsFromMeal < ActiveRecord::Migration
  def change
    remove_column :meals, :multiplier
    remove_column :meals, :total_cost
  end
end
