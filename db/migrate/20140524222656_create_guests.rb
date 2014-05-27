class CreateGuests < ActiveRecord::Migration
  def change
    create_table :guests do |t|
      t.string :name
      t.integer :multiplier
      t.integer :host_id

      t.timestamps
    end
  end
end
