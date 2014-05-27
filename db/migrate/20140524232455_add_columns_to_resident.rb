class AddColumnsToResident < ActiveRecord::Migration
  def change
    add_column :residents, :active, :boolean, null: false, default: false
    add_column :residents, :locked, :boolean, null: false, default: false
  end
end
