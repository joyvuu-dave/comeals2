class CreateMealResidents < ActiveRecord::Migration
  def change
    create_table :meal_residents do |t|
      t.integer :meal_id
      t.integer :resident_id

      t.timestamps
    end
  end
end
