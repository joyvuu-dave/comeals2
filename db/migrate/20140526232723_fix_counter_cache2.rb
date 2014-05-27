class FixCounterCache2 < ActiveRecord::Migration
  def change
    add_column :meals, :bills_count, :integer, null: false, default: 0
    remove_column :bills, :meals_count
    remove_column :attendances, :meals_count
  end
end
