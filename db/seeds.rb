# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
require 'faker'

puts "Cleaning database"
Timer.destroy_all

# Timer.create(ingredient: 'pizza', time: 10)
# Timer.create(ingredient: 'flour', time: 15)

# user_one = User.create(email: "lewagon@lewagon.com", password: "123456")


puts "creating timers"


50.times do
  Timer.create(ingredient: Faker::Food.unique.ingredient, time: rand(5..30))
end
