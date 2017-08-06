# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


Element.delete_all
Element.create! id: 1, name: "O2 Sensor", desciption: "A simple sensor", brand: "Vernier", units: "g/m^2", uncertainty: 0.2, available: true, amount: 12, school: "Nueva York"

ReserveStatus.delete_all
ReserveStatus.create! id: 1, name: "In Progress"
ReserveStatus.create! id: 2, name: "Placed"
ReserveStatus.create! id: 3, name: "Shipped"
ReserveStatus.create! id: 4, name: "Cancelled"
