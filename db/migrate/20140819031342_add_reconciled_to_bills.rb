class AddReconciledToBills < ActiveRecord::Migration
  def change
    add_column :bills, :reconciled, :boolean, null: false, default: false
  end
end
