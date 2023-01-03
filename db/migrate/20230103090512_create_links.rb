class CreateLinks < ActiveRecord::Migration[7.0]
  def change
    create_table :links do |t|
      t.references :result, null: false, foreign_key: true
      t.boolean :is_active, null: false, default: false
      t.string :link

      t.timestamps
    end
  end
end
