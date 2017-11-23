# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Booking.destroy_all
Vehicle.destroy_all
Contract.destroy_all
Offer.destroy_all
Person.destroy_all

steve = Person.create(address:"Paris", email:"test@test.com", firstName: "Steve", surName: "Johny")
green = Offer.create(price: 120, name: "Green Thumb", description: "Perfect choice for Eco conscious!", status: "active")
budget = Offer.create(price: 75, name: "Value Miner", description: "Great cars for the best value!", status: "active")
business = Offer.create(price: 150, name: "Business Guru", description: "The best, when you really want to shine!", status: "active")
contract1 = Contract.create(person: steve, offer: green, startDate: Date.today, status: "active")
egolf = Vehicle.create(offer: green, make: "VW", model: "e-Golf", colour: "white", manufactureYear: 2016, KM: 4300, fuelType: "electric", enginePower: 75, status: "occupied", licensePlate: "X-16-XVJ")
leaf = Vehicle.create(offer: green, make: "Nissan", model: "Leaf", colour: "green", manufactureYear: 2015, KM: 12200, fuelType: "electric", enginePower: 81, licensePlate: "16-XV-24")
bookingSteve1 = Booking.create(contract: contract1, startDate: Date.today, vehicle: egolf, status: "active")
