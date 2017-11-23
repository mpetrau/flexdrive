class EmailValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
    unless value =~ /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i
      record.errors[attribute] << (options[:message] || "is not an email")
    end
  end
end

class Person < ApplicationRecord
  has_many :contracts
  has_many :bookings, through: :contracts
  has_many :vehicles, through: :bookings
  has_many :offers, through: :contracts

  validates :address, :firstName, :surName, presence: true
  validates :email, presence: true, uniqueness: true, email: true
end

