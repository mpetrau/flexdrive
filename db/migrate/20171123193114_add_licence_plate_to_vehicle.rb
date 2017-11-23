class AddLicencePlateToVehicle < ActiveRecord::Migration[5.1]
  def change
    add_column :vehicles, :licensePlate, :string
  end
end
