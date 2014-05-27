class AddIndexesToBills < ActiveRecord::Migration
  def change
    add_index :bills, :meal_id
    add_index :bills, :cook_id
    add_index :bills, [:meal_id, :cook_id], unique: true
  end
end
