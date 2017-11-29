class Person < ApplicationRecord
  has_many :emails
  has_many :orders
  has_many :vehicles, through: :orders

  validates :firstName, :surName, presence: true
end
