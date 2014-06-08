class AddConfirmableToDevise < ActiveRecord::Migration
  def change
    add_column :admin_users, :confirmation_token, :string
    add_column :admin_users, :confirmed_at, :datetime
    add_column :admin_users, :confirmation_sent_at, :datetime
    add_index :admin_users, :confirmation_token, unique: true
    AdminUser.update_all(confirmed_at: Time.now)
    # All existing user accounts should be able to log in after this.
  end
end
