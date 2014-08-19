class RemoveForeignKeys < ActiveRecord::Migration
  def change
    remove_foreign_key :bills, name: 'bills_meal_id_fk'
    remove_foreign_key :bills, name: 'bills_resident_id_fk'
    remove_foreign_key :meal_residents, name: 'meal_residents_meal_id_fk'
    remove_foreign_key :meal_residents, name: 'meal_residents_resident_id_fk'
    remove_foreign_key :residents, name: 'residents_unit_id_fk'
  end
end
