class AddAttendeeTypeToAttendance < ActiveRecord::Migration
  def change
    add_column :attendances, :attendee_type, :string
  end
end
