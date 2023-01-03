class CreateResultsInfections < ActiveRecord::Migration[7.0]
  def change
    create_table :results_infections do |t|
      t.references :infection, null: false, foreign_key: true
      t.references :result, null: false, foreign_key: true
      t.string :status
      t.boolean :is_treated
      t.datetime :start_date
      t.datetime :end_date

      t.timestamps
    end
  end
end
