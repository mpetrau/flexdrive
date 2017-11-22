class CreateContracts < ActiveRecord::Migration[5.1]
  def change
    create_table :contracts do |t|
      t.date :startDate
      t.integer :discount
      t.references :offer, foreign_key: true
      t.references :person, foreign_key: true
      t.string :status, "new"

      t.timestamps
    end
  end
end
