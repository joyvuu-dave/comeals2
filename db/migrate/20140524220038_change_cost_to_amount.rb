class ChangeCostToAmount < ActiveRecord::Migration
  def change
    rename_column :bills, :cost, :amount
  end
end
