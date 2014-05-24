class CreateAttendances < ActiveRecord::Migration
  def change
    create_table :attendances do |t|
      t.integer :resident_id
      t.integer :meal_id
      t.integer :multiplier

      t.timestamps
    end
  end
end
