class AddNotNullContraintsToMealResidents < ActiveRecord::Migration
  def change
    change_column :meal_residents, :created_at, :datetime, null: false
    change_column :meal_residents, :updated_at, :datetime, null: false
  end
end
