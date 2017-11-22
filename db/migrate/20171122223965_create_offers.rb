class CreateOffers < ActiveRecord::Migration[5.1]
  def change
    create_table :offers do |t|
      t.integer :price, default: 0
      t.string :name
      t.string :description
      t.string :status, default: "draft"

      t.timestamps
    end
  end
end
