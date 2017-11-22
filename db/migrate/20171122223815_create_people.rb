class CreatePeople < ActiveRecord::Migration[5.1]
  def change
    create_table :people do |t|
      t.string :address
      t.string :email
      t.string :firstName
      t.string :surName

      t.timestamps
    end
  end
end
