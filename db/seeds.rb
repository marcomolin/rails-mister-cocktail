# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'json'
require 'open-uri'
Dose.destroy_all
Cocktail.destroy_all

Ingredient.destroy_all

filepath = 'https://www.thecocktaildb.com/api/json/v1/1/list.php?i=list'

serialized_ingredients = open(filepath).read
ingredients = JSON.parse(serialized_ingredients)
ingredients['drinks'].each do |ingredient|
  Ingredient.create(name: ingredient['strIngredient1'])
  puts ingredient['strIngredient1']
end

cocktail_names = %w(gin tonic fernet ron cuba libre daikiri)
doses_description = %w(gin tonic fernet ron cuba libre daikiri)
cocktail_names.each do |name|
  cocktail = Cocktail.create(name: name )
  puts "created new cocktail = #{cocktail.name}"
  2.times do
    dose = Dose.create(
      description: doses_description.sample,
      cocktail: cocktail,
      ingredient: Ingredient.all.sample
      )
    puts "created dose cocktail = #{dose.description}"

  end
end
