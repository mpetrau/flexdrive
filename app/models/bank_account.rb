class BankAccount < ApplicationRecord
  has_many :orders
end
