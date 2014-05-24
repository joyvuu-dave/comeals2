class CreateBills < ActiveRecord::Migration
  def change
    create_table :bills do |t|
      t.integer :meal_id
      t.integer :resident_id
      t.integer :cost

      t.timestamps
    end
  end
end
