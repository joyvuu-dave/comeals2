class AddIndexToResidentsTable < ActiveRecord::Migration
  def change
    add_index :residents, :unit_id
  end
end
