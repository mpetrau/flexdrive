class AddDataToPerson < ActiveRecord::Migration[5.1]
  def change
    add_column :people, :salutation, :string
    add_column :people, :firstNameInitials, :string
    add_column :people, :birthDate, :string
  end
end
