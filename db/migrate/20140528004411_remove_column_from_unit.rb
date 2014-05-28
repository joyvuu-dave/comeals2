class RemoveColumnFromUnit < ActiveRecord::Migration
  def change
    remove_column :units, :balance
  end
end
