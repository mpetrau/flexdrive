class Vehicle < ApplicationRecord
  has_many :orders
  has_many :people, through: :orders

  validates :make, :modelVariant, :modelRange, :colour, presence: true

  def name
    "#{make} #{modelRange} (#{modelVariant})"
  end
end
