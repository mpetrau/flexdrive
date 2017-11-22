class Vehicle < ApplicationRecord
  belongs_to :offer
  has_many :bookings
  has_many :contracts, through: :bookings
  has_many :persons, through: :contracts
end
