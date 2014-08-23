class RemoveReconciliationIdIndexAndAllNull < ActiveRecord::Migration
  def change
    remove_index :bills, :reconciliation_id
    change_column_null :bills, :reconciliation_id, true
  end
end
