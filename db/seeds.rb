# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
# puts "Cleaning database ... "

puts "Destroy Cocktails ... "
Cocktail.delete_all

puts "Destroy Ingredients ... "
Ingredient.delete_all

puts "Creating Ingredients ..."

require 'json'
require 'open-uri'

url = 'https://www.thecocktaildb.com/api/json/v1/1/list.php?i=list'
drinks = open(url).read
ingredients = JSON.parse(drinks)

ingredients["drinks"].each do |ingredient|
  Ingredient.create!(name:"#{ingredient["strIngredient1"]}")
end

puts "Ingedients created!"

puts "Creating Cocktails ... "

require 'open-uri'
require 'nokogiri'

url = 'https://www.1001cocktails.com/recettes/selection_96-grands-classiques.aspx'

html_file = open(url).read
html_doc = Nokogiri::HTML(html_file)

html_doc.search('.recipe-card__title').first(15).each do |element|
  Cocktail.create!(name:"#{element.text.strip}")
end

puts "Cocktails created!"

puts "OK!!"
