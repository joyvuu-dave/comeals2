class ChangeResidentToCook < ActiveRecord::Migration
  def change
    rename_column :bills, :resident_id, :cook_id
  end
end
