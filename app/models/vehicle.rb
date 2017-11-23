class Vehicle < ApplicationRecord
  belongs_to :offer
  has_many :bookings
  has_many :contracts, through: :bookings
  has_many :persons, through: :contracts

  VEHICLE_STATUS = %w(ordered available booked occupied expired insale sold)
  FUEL_TYPE = %w(electric petrol diesel)


  validates :make, :model, :colour, :fuelType, :offer, :status, presence: true
  validates :manufactureYear, :enginePower, presence: true, numericality: true
  validates :licensePlate, uniqueness: true
  validates :status, inclusion: { in: VEHICLE_STATUS }
  validates :fuelType, inclusion: { in: FUEL_TYPE }
end
