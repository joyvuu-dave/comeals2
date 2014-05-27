class RemoveUneededColumns < ActiveRecord::Migration
  def change
    remove_column :bills, :reconciled
    remove_column :bills, :locked
    remove_column :meals, :hidden
    remove_column :meals, :locked
    remove_column :residents, :active
    remove_column :residents, :locked
  end
end
