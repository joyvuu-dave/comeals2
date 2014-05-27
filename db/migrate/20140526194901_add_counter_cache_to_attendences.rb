class AddCounterCacheToAttendences < ActiveRecord::Migration
  def change
    add_column :attendances, :meals_count, :integer, null: false, default: 0
    add_column :bills, :meals_count, :integer, null: false, default: 0
  end
end
