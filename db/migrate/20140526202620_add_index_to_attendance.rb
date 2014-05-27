class AddIndexToAttendance < ActiveRecord::Migration
  def change
    add_index :attendances, [:attendee_id, :attendee_type]
  end
end
