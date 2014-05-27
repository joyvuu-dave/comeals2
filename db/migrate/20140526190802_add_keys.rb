class AddKeys < ActiveRecord::Migration
  def change
    add_foreign_key "attendances", "meals", name: "attendances_meal_id_fk"
    add_foreign_key "bills", "residents", name: "bills_cook_id_fk", column: "cook_id"
    add_foreign_key "bills", "meals", name: "bills_meal_id_fk"
    add_foreign_key "bills", "residents", name: "bills_resident_id_fk"
    add_foreign_key "guests", "residents", name: "guests_resident_id_fk"
    add_foreign_key "residents", "units", name: "residents_unit_id_fk"
  end
end
