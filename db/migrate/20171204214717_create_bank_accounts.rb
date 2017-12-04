class CreateBankAccounts < ActiveRecord::Migration[5.1]
  def change
    create_table :bank_accounts do |t|
      t.string :BAN
      t.string :BIC
      t.string :IBAN

      t.timestamps
    end
  end
end
