# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
 c = Category.create(name: "Games", is_default: "true")
 d = Category.create(name: "Bakery", is_default: "true")
 e = Category.create(name: "Accessries", is_default: "true")
