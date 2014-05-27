class AddDefaultToAmount < ActiveRecord::Migration
  def change
    change_column :bills, :amount, :integer, null: false, default: false
  end
end
