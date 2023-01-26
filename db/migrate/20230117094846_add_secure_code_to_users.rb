class AddSecureCodeToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :secure_code, :string
    add_column :users, :code_expiration_date, :datetime
    add_column :users, :code_uses_remaining, :integer
    add_index :users, :secure_code, unique: true
  end
end
