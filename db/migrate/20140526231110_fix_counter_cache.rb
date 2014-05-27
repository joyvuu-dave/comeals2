class FixCounterCache < ActiveRecord::Migration
  def change
    remove_column :residents, :unit_cache
    add_column :units, :residents_count, :integer, null: false, default: 0
  end
end
