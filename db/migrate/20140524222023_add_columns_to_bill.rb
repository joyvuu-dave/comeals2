class AddColumnsToBill < ActiveRecord::Migration
  def change
    add_column :bills, :reconciled, :boolean, null: false, default: false
    add_column :bills, :unit_cost, :integer, null: false, default: 0
    add_column :bills, :locked, :boolean, null: false, default: false
  end
end
