class AddSlugToUnits < ActiveRecord::Migration
  def change
    add_column :units, :slug, :string
    add_index :units, :slug, unique: true
  end
end
