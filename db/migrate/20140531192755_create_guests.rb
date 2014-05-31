class CreateGuests < ActiveRecord::Migration
  def change
    create_table :guests do |t|
      t.string :name, null: false
      t.integer :multiplier, default: 2, null: false
      t.integer :meal_id, null: false
      t.integer :resident_id, null: false

      t.timestamps
    end
  end
end
