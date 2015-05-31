class AddBalanceUpdatedAtToResidents < ActiveRecord::Migration
  def change
    add_column :residents, :balance_updated_at, :datetime
  end
end
