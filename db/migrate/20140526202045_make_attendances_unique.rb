class MakeAttendancesUnique < ActiveRecord::Migration
  def change
    add_index :attendances, [:attendee_id, :meal_id, :attendee_type], unique: true
  end
end
