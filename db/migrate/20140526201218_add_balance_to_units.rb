class AddBalanceToUnits < ActiveRecord::Migration
  def change
    add_column :units, :balance, :integer, null: false, default: 0
  end
end
