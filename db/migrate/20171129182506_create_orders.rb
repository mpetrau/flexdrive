class CreateOrders < ActiveRecord::Migration[5.1]
  def change
    create_table :orders do |t|
      t.references :vehicle, foreign_key: true
      t.references :person, foreign_key: true

      t.timestamps
    end
  end
end
