class CreateMeals < ActiveRecord::Migration
  def change
    create_table :meals do |t|
      t.datetime :date

      t.timestamps
    end
  end
end
