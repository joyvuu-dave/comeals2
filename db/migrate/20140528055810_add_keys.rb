class AddKeys < ActiveRecord::Migration
  def change
    add_foreign_key "bills", "meals", name: "bills_meal_id_fk"
    add_foreign_key "bills", "residents", name: "bills_resident_id_fk"
    add_foreign_key "meal_residents", "meals", name: "meal_residents_meal_id_fk"
    add_foreign_key "meal_residents", "residents", name: "meal_residents_resident_id_fk"
    add_foreign_key "residents", "units", name: "residents_unit_id_fk"
  end
end
