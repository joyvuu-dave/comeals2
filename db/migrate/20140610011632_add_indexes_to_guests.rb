class AddIndexesToGuests < ActiveRecord::Migration
  def change
    add_index :guests, :meal_id
    add_index :guests, :resident_id
  end
end
