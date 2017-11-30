# json.extract! @order, :person, :vehicle

json.Vehicle do |json|
    json.extract! @order.vehicle, :make, :modelRange, :modelVariant, :colour
end

json.Person do |json|
    json.Email @order.person.emails, :emailAddress
    json.Name @order.person, :firstName, :surName
end
