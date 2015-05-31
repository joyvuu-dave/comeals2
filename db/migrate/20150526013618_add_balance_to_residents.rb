class AddBalanceToResidents < ActiveRecord::Migration
  def change
    add_column :residents, :balance, :integer, default: 0, null: false
  end
end
