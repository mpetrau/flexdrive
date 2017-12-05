class Address < ApplicationRecord
  belongs_to :person

  def name
    "#{postalCode}, #{city} (#{country})"
  end
end
