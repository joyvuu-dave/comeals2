class AddMultiplierToMealResident < ActiveRecord::Migration
  def change
    add_column :meal_residents, :multiplier, :integer, default: 2, null: false
  end
end
