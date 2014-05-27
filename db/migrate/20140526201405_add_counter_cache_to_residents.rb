class AddCounterCacheToResidents < ActiveRecord::Migration
  def change
    add_column :residents, :unit_cache, :integer, null: false, default: 0
  end
end
