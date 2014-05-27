class AddNotNullConstraints < ActiveRecord::Migration
  def change
    change_column :bills, :meal_id, :integer, null: false
    change_column :bills, :cook_id, :integer, null: false
    change_column :attendances, :attendee_id, :integer, null: false
    change_column :attendances, :meal_id, :integer, null: false
    change_column :attendances, :multiplier, :integer, null: false, default: 2
    change_column :attendances, :attendee_type, :string, null: false, default: "Resident"
    change_column :guests, :name, :string, null: false
    add_index :guests, :name, unique: true
    change_column :guests, :multiplier, :integer, null: false, default: 2
    change_column :guests, :host_id, :integer, null: false
    change_column :meals, :date, :datetime, null: false
    add_index :meals, :date, unique: true
    change_column :residents, :name, :string, null: false
    add_index :residents, :name, unique: true
    change_column :residents, :multiplier, :integer, null: false, default: 2
    change_column :residents, :balance, :integer, null: false, default: 0
    change_column :residents, :unit_id, :integer, null: false
    change_column :units, :name, :string, null: false
  end
end
