class CreateVehicles < ActiveRecord::Migration[5.1]
  def change
    create_table :vehicles do |t|
      t.string :make
      t.string :model
      t.string :colour
      t.integer :manufactureYear
      t.integer :KM, default: 0
      t.string :fuelType
      t.integer :enginePower
      t.string :status, default: "available"
      t.references :offer, foreign_key: true

      t.timestamps
    end
  end
end
