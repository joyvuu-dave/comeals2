class RenameResidentToAttendee < ActiveRecord::Migration
  def change
    rename_column :attendances, :resident_id, :attendee_id
  end
end
