class Person < ApplicationRecord
  has_many :contracts
  has_many :bookings, through: :contracts
  has_many :vehicles, through: :bookings
  has_many :offers, through: :contracts
end
