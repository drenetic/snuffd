class AddUuidToLinks < ActiveRecord::Migration[7.0]
  def change
    add_column :links, :uuid, :string, unique: true
  end
end
