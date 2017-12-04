class Person < ApplicationRecord
  has_many :emails
  has_many :telephones
  has_many :orders
  has_one :address
  has_many :vehicles, through: :orders
  has_many :bank_accounts, through: :orders

  accepts_nested_attributes_for :emails
  accepts_nested_attributes_for :telephones

  validates :firstName, :surName, presence: true

  def name
    "#{firstName} #{surName}"
  end
end
