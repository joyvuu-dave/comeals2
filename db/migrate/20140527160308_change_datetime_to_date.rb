class ChangeDatetimeToDate < ActiveRecord::Migration
  def change
    change_column :meals, :date, :date, null: false
  end
end
