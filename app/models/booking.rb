class Booking < ApplicationRecord
  belongs_to :contract
  belongs_to :vehicle

  BOOKING_STATUS = %w(requested confirmed active expired)

  validates :startDate, :contract, :vehicle, presence: true
  validates :status, presence: true, inclusion: { in: BOOKING_STATUS }
end
