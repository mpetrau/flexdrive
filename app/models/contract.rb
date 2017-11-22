class Contract < ApplicationRecord
  belongs_to :offer
  belongs_to :person
  has_many :bookings
  has_many :vehicles, through: :bookings
end
