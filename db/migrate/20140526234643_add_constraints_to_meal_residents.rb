class AddConstraintsToMealResidents < ActiveRecord::Migration
  def change
    change_column :meal_residents, :meal_id, :integer, null: false
    change_column :meal_residents, :resident_id, :integer, null: false
    add_index :meal_residents, [:meal_id, :resident_id]
  end
end
