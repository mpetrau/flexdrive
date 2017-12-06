class Person < ApplicationRecord
  has_many :emails
  has_many :telephones
  has_many :orders
  has_one :address
  has_many :vehicles, through: :orders
  has_many :bank_accounts, through: :orders

  accepts_nested_attributes_for :emails, reject_if: :all_blank, allow_destroy: true
  accepts_nested_attributes_for :telephones, reject_if: :all_blank, allow_destroy: true
  accepts_nested_attributes_for :address, reject_if: :all_blank, allow_destroy: true

  validates :firstName, :surName, presence: true

  def name
    "#{firstName} #{surName}"
  end
end
