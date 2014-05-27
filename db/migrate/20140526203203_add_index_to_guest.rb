class AddIndexToGuest < ActiveRecord::Migration
  def change
    add_index :guests, :host_id
  end
end
