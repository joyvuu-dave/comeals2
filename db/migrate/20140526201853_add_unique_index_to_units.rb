class AddUniqueIndexToUnits < ActiveRecord::Migration
  def change
    add_index :units, :name, unique: true
  end
end
