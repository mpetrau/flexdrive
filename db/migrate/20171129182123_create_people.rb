class CreatePeople < ActiveRecord::Migration[5.1]
  def change
    create_table :people do |t|
      t.string :surName
      t.string :firstName

      t.timestamps
    end
  end
end
