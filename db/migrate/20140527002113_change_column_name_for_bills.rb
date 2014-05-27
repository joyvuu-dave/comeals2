class ChangeColumnNameForBills < ActiveRecord::Migration
  def change
    remove_index :bills, name: :index_bills_on_meal_id_and_cook_id
    remove_index :bills, name: :index_bills_on_cook_id
    rename_column :bills, :cook_id, :resident_id
    add_index :bills, :resident_id
  end
end
