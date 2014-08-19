class AddSlugToResident < ActiveRecord::Migration
  def change
    add_column :residents, :slug, :string
    add_index :residents, :slug, unique: true
  end
end
