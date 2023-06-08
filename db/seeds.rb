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
Recipe.destroy_all
User.destroy_all

# Timer.create(ingredient: 'pizza', time: 10)
# Timer.create(ingredient: 'flour', time: 15)

user_one = User.create(email: "lewagon@lewagon.com", password: "123456")
user_two = User.create(email: "test@lewagon.com", password: "123456")
user_three = User.create(email: "ismaeel@lewagon.com", password: "123456")

puts "creating timers"


50.times do
  Timer.create(ingredient: Faker::Food.unique.ingredient, time: rand(5..30))
end

10.times do
  recipe = Recipe.new(name: Faker::Food.dish)
  recipe.user = user_one
  recipe.save!
end

10.times do
  recipe = Recipe.new(name: Faker::Food.dish)
  recipe.user = user_two
  recipe.save!
end

10.times do
  recipe = Recipe.new(name: Faker::Food.dish)
  recipe.user = user_three
  recipe.save!
  10.times do
    RecipeTimer.create!(ingredient: Faker::Food.unique.ingredient, time: rand(5.0..30.0), recipe_id: recipe.id)
  end
end
