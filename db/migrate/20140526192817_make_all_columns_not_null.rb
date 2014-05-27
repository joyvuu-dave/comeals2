class MakeAllColumnsNotNull < ActiveRecord::Migration
  def change
    change_column :attendances, :created_at, :datetime, null: false
    change_column :attendances, :updated_at, :datetime, null: false

    change_column :bills, :created_at, :datetime, null: false
    change_column :bills, :updated_at, :datetime, null: false

    change_column :guests, :created_at, :datetime, null: false
    change_column :guests, :updated_at, :datetime, null: false

    change_column :meals, :created_at, :datetime, null: false
    change_column :meals, :updated_at, :datetime, null: false

    change_column :residents, :created_at, :datetime, null: false
    change_column :residents, :updated_at, :datetime, null: false

    change_column :units, :created_at, :datetime, null: false
    change_column :units, :updated_at, :datetime, null: false
  end
end
