class CreateVehicles < ActiveRecord::Migration[5.1]
  def change
    create_table :vehicles do |t|
      t.string :make
      t.string :modelRange
      t.string :modelVariant
      t.string :colour

      t.timestamps
    end
  end
end
