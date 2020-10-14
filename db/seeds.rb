# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Category.destroy_all

Category.create(name: "Restaurant")
Category.create(name: "Retail")
Category.create(name: "Hotel")
Category.create(name: "Bar")
Category.create(name: "Coffee Shop/Cafe")
Category.create(name: "Gym")
Category.create(name: "Medical")

