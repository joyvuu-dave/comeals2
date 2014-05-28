class RemoveUnitCost < ActiveRecord::Migration
  def change
    remove_column :bills, :unit_cost
  end
end
