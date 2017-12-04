class Order < ApplicationRecord
  belongs_to :vehicle
  belongs_to :person
  belongs_to :bank_account

  validates :vehicle, :person, :bank_account, presence: true

end
