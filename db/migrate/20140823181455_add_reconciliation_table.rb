class AddReconciliationTable < ActiveRecord::Migration
  def change
    create_table :reconciliations do |t|
      t.date :date, null: false

      t.timestamps
    end

    add_index :reconciliations, :date, unique: true

    # Create association on bills table
    add_column :bills, :reconciliation_id, :integer
    add_index :bills, :reconciliation_id
  end
end
