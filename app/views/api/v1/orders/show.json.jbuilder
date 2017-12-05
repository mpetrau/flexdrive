# json.extract! @order, :person, :vehicle

json.ignore_nil!

json.Person do |json|
  emails = @order.person.emails
  person = @order.person
  phones = @order.person.telephones
  address = @order.person.address
  json.Email emails, :emailAddress if emails.presence
  if person.presence
    json.Name person, :firstName, :surName, :salutation, :firstNameInitials
    json.Birthdate @order.person, :birthDate
  end
  json.Telephone phones, :telephoneNumber, :telephoneNumberType, :countryCode, :defaultTelephoneNumber if phones.presence
  json.Address address, :addressType, :buildingName, :streetNumber, :streetName, :streetNumberSuffix, :postalCode, :city, :province, :country if address.presence
end


json.Vehicle do |json|
  json.extract! @order.vehicle, :make, :modelRange, :modelVariant, :colour
end


