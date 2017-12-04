class Telephone < ApplicationRecord
  belongs_to :person

  validates :telephoneNumber, presence: true, uniqueness: true
end
