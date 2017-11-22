class Offer < ApplicationRecord
  has_many :vehicles
  has_many :contracts
  has_many :persons, through: :contracts
  has_many :bookings, through: :contracts
end
