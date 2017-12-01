class Person < ApplicationRecord
  has_many :emails
  has_many :orders
  has_many :vehicles, through: :orders
  accepts_nested_attributes_for :emails

  validates :firstName, :surName, presence: true

  def name
    "#{firstName} #{surName}"
  end
end
