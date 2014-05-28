class SetDefaultOnBill < ActiveRecord::Migration
  def change
    change_column :bills, :amount_decimal, :decimal, precision: 12, scale: 2, null: false, default: 0.0
  end
end
