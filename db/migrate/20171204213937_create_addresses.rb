class CreateAddresses < ActiveRecord::Migration[5.1]
  def change
    create_table :addresses do |t|
      t.string :addressType
      t.string :buildingName
      t.string :streetName
      t.string :streetNumber
      t.string :streetNumberSuffix
      t.string :postalCode
      t.string :city
      t.string :province
      t.string :country
      t.references :person, foreign_key: true

      t.timestamps
    end
  end
end
