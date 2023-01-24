class AddDurationToInfections < ActiveRecord::Migration[7.0]
  def change
    add_column :infections, :duration, :integer
  end
end
