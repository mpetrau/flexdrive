class CreateTelephones < ActiveRecord::Migration[5.1]
  def change
    create_table :telephones do |t|
      t.string :telephoneNumber
      t.string :telephoneNumberType
      t.string :countryCode
      t.boolean :defaultTelephoneNumber
      t.references :person, foreign_key: true

      t.timestamps
    end
  end
end
