class AddParamatersToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :patient_reference, :string
    add_column :users, :first_name, :string
    add_column :users, :last_name, :string
    add_column :users, :nickname, :string
    add_column :users, :gender, :string
    add_column :users, :orientation, :string
    add_column :users, :location, :string
    add_column :users, :bio, :string
    add_column :users, :date_of_birth, :datetime
    add_column :users, :is_doctor, :boolean
    add_column :users, :provider_number, :string
  end
end
