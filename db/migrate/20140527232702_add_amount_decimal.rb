class AddAmountDecimal < ActiveRecord::Migration
  def change
    add_column :bills, :amount_decimal, :decimal, precision: 12, scale: 2
  end
end
