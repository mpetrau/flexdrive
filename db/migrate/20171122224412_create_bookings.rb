class CreateBookings < ActiveRecord::Migration[5.1]
  def change
    create_table :bookings do |t|
      t.date :startDate
      t.integer :duration, default: 31
      t.integer :KMdriven, default: 0
      t.references :contract, foreign_key: true
      t.references :vehicle, foreign_key: true
      t.string :status, default: "requested"

      t.timestamps
    end
  end
end
