class RemoveForeignKeys < ActiveRecord::Migration
  def change
    remove_foreign_key :bills, :meal
    remove_foreign_key :bills, :resident
    remove_foreign_key :meal_residents, :meal
    remove_foreign_key :meal_residents, :resident
    remove_foreign_key :residents, :unit
  end
end
