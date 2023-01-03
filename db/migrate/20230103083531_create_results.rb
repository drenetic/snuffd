class CreateResults < ActiveRecord::Migration[7.0]
  def change
    create_table :results do |t|
      t.references :user, null: false, foreign_key: true
      t.references :doctor, null: false, foreign_key: { to_table: :users }
      t.datetime :test_date
      t.datetime :next_test_date

      t.timestamps
    end
  end
end
