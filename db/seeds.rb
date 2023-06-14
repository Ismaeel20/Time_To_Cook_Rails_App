# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
require 'faker'

puts "Cleaning database"
RecipeTimer.destroy_all
Timer.destroy_all
Recipe.destroy_all
User.destroy_all

# Timer.create(ingredient: 'pizza', time: 10)
# Timer.create(ingredient: 'flour', time: 15)

user_one = User.create(email: "lewagon@lewagon.com", password: "123456")
user_two = User.create(email: "test@lewagon.com", password: "123456")
user_three = User.create(email: "ismaeel@lewagon.com", password: "123456")

puts "creating timers"

Timer.create(ingredient: 'Chips', time: 15)
Timer.create(ingredient: 'Rice', time: 20)
Timer.create(ingredient: 'Pasta', time: 10)
Timer.create(ingredient: 'Roast Beef', time: 20)
Timer.create(ingredient: 'Roast chicken', time: 45)
Timer.create(ingredient: 'Peas', time: 3)
Timer.create(ingredient: 'Broccoli', time: 5)
Timer.create(ingredient: 'Black Beans', time: 60)
Timer.create(ingredient: 'Northern Beans', time: 45)
Timer.create(ingredient: 'Shrimp', time: 6)
Timer.create(ingredient: 'Salmon', time: 15)
Timer.create(ingredient: 'Scallops', time: 3)
Timer.create(ingredient: 'Lobster', time: 5)

recipe = Recipe.new(name: 'Burrito')
recipe.user = user_one
recipe.save!
RecipeTimer.create!(ingredient: "Rice", time: 15, recipe_id: recipe.id)
RecipeTimer.create!(ingredient: "Chopped red onion", time: 5, recipe_id: recipe.id)
RecipeTimer.create!(ingredient: "Green pepper", time: 5, recipe_id: recipe.id)
RecipeTimer.create!(ingredient: "Spices", time: 1, recipe_id: recipe.id)
RecipeTimer.create!(ingredient: "Beef mince", time: 5, recipe_id: recipe.id)
RecipeTimer.create!(ingredient: "Add chopped tomatoes", time: 2, recipe_id: recipe.id)
RecipeTimer.create!(ingredient: "Tortilla", time: 1, recipe_id: recipe.id)

# 10.times do
#   recipe = Recipe.new(name: Faker::Food.dish)
#   recipe.user = user_one
#   recipe.save!
# end

# 10.times do
#   recipe = Recipe.new(name: Faker::Food.dish)
#   recipe.user = user_two
#   recipe.save!
# end

# 10.times do
#   recipe = Recipe.new(name: Faker::Food.dish)
#   recipe.user = user_three
#   recipe.save!
#   10.times do
#     RecipeTimer.create!(ingredient: Faker::Food.unique.ingredient, time: rand(5.0..30.0), recipe_id: recipe.id)
#   end
