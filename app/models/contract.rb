class Contract < ApplicationRecord
  belongs_to :offer
  belongs_to :person
  has_many :bookings
  has_many :vehicles, through: :bookings

  CONTRACT_STATUS = %w(draft submitted signed active exprired)

  validates :startDate, :offer, :person, presence: true
  validates :status, presence: true, inclusion: { in: CONTRACT_STATUS }
  validates :discount, numericality: { less_than: 100 }
end
