class Offer < ApplicationRecord
  has_many :vehicles
  has_many :contracts
  has_many :persons, through: :contracts
  has_many :bookings, through: :contracts

  OFFER_STATUS = %w(draft active exprired)

  validates :name, :description, presence: true
  validates :status, presence: true, inclusion: { in: OFFER_STATUS }
  validates :price, numericality: true

end
