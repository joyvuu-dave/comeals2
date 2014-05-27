class RemoveTables < ActiveRecord::Migration
  def change
    drop_table :guests
    drop_table :attendances
  end
end
