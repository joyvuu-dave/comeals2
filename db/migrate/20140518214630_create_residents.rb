class CreateResidents < ActiveRecord::Migration
  def change
    create_table :residents do |t|
      t.string :name
      t.integer :multiplier
      t.integer :balance
      t.integer :unit_id

      t.timestamps
    end
  end
end
