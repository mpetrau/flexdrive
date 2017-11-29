class Order < ApplicationRecord
  belongs_to :vehicle
  belongs_to :person

  validates :vehicle, :person, presence: true

end
