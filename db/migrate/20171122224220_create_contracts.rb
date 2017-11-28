class CreateContracts < ActiveRecord::Migration[5.1]
  def change
    create_table :contracts do |t|
      t.date :startDate
      t.integer :discount, default: 0
      t.string :status
      t.references :offer, foreign_key: true
      t.references :person, foreign_key: true

      t.timestamps
    end
  end
end
