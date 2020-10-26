# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

puts "Cleaning database ... "

puts "Destroy Cocktails ... "
Cocktail.delete_all

puts "Destroy Ingredients ... "
Ingredient.delete_all

puts "Destroy Doses ... "
Dose.delete_all

puts "Creating Users ..."

michel = User.create!(email:'michel@gmail.com', password:'MichelMichel')

puts "Users OK!"

puts "Creating Ingredients ..."

require 'json'
require 'open-uri'

url = 'https://www.thecocktaildb.com/api/json/v1/1/list.php?i=list'
drinks = open(url).read
ingredients = JSON.parse(drinks)

ingredients["drinks"].each do |ingredient|
  Ingredient.create!(name:"#{ingredient["strIngredient1"]}")
end

puts "Ingedients OK!"

puts "Creating Cocktails ... "

cosmopolitan = Cocktail.create!(name:'Cosmopolitan', user:michel, description:"The tangy concoction of vodka, triple sec, lime juice and cranberry juice has managed to leapfrog the venerable screwdriver as many vodka drinkers prefer the Cosmopolitan’s cleaner and slightly tart taste. The keys to the preparation of a Cosmopolitan are a good brand of cranberry juice and Cointreau Triple Sec, two essential elements to the drink.")
mojito = Cocktail.create!(name:'Mojito', user:michel, description:"The Mojito complimenting summer perfectly with a fresh minty taste. The mixture of white rum, mint, lime juice, sugar and soda water is crisp and clean with a relatively low alcohol content, the soda water can be replaced with sprite or 7-up. When preparing a mojito always crush the mint leaves as opposed to dicing to unlock oils that will assist with enhancing the minty flavour.")
margarita = Cocktail.create!(name:'Margarita', user:michel, description:"The simple mixture of tequila, triple sec and lime juice is often blended with ice but is traditionally served on the rocks. The cocktail is generally presented in a salt rimmed glass. Various fruity versions have been adapted from the traditional lime, such as raspberry, peach and strawberry.")
pina_colada = Cocktail.create!(name:'Piña Colada', user:michel, description:"The classic tropical cocktail, with a distinctive look and taste. More of a smoothie as opposed to an alcoholic beverage. The modest yet perfect blend of coconut milk, rum and pineapple juice has been a firm favourite throughout the years.")

puts "Cocktails OK!"

puts "Creating Doses ... "

cosmo_lemon_vodka = Dose.create!(cocktail:cosmopolitan, ingredient_id:13, amount:45, unit:"ml")
cosmo_triple_sec = Dose.create!(cocktail:cosmopolitan, ingredient_id:9, amount:15, unit:"ml")
cosmo_lime_juice = Dose.create!(cocktail:cosmopolitan, ingredient_id:30, amount:10, unit:"ml")
cosmo_orange = Dose.create!(cocktail:cosmopolitan, ingredient_id:73, amount:1, unit:"slice")

mojito_lime = Dose.create!(cocktail:mojito, ingredient_id:56, amount:1, unit:"unit")
mojito_sugar = Dose.create!(cocktail:mojito, ingredient_id:25, amount:5, unit:"ml")
mojito_rum = Dose.create!(cocktail:mojito, ingredient_id:40, amount:60, unit:"ml")
mojito_carbonated_water = Dose.create!(cocktail:mojito, ingredient_id:33, amount:60, unit:"ml")

margarita_tequila = Dose.create!(cocktail:margarita, ingredient_id:21, amount:50, unit:"ml")
margarita_lime_juice = Dose.create!(cocktail:margarita, ingredient_id:30, amount:25, unit:"ml")
margarita_triple_sec = Dose.create!(cocktail:margarita, ingredient_id:9, amount:20, unit:"ml")

pina_colada_rum = Dose.create!(cocktail:pina_colada, ingredient_id:40, amount:60, unit:"ml")
pina_colada_pineapple_juice = Dose.create!(cocktail:pina_colada, ingredient_id:47, amount:120, unit:"ml")


puts "Doses OK!"

puts "OK!"

#<Ingredient:0x00007ff779d7feb0 id: 1, name: "Light rum", created_at: Mon, 26 Oct 2020 13:02:18 UTC +00:00, updated_at: Mon, 26 Oct 2020 13:02:18 UTC +00:00>,
 #<Ingredient:0x00007ff779f2dc30 id: 2, name: "Applejack", created_at: Mon, 26 Oct 2020 13:02:18 UTC +00:00, updated_at: Mon, 26 Oct 2020 13:02:18 UTC +00:00>,
 #<Ingredient:0x00007ff779f2d848 id: 3, name: "Gin", created_at: Mon, 26 Oct 2020 13:02:18 UTC +00:00, updated_at: Mon, 26 Oct 2020 13:02:18 UTC +00:00>,
 #<Ingredient:0x00007ff779f2d780 id: 4, name: "Dark rum", created_at: Mon, 26 Oct 2020 13:02:18 UTC +00:00, updated_at: Mon, 26 Oct 2020 13:02:18 UTC +00:00>,
 #<Ingredient:0x00007ff779f2d460 id: 5, name: "Sweet Vermouth", created_at: Mon, 26 Oct 2020 13:02:18 UTC +00:00, updated_at: Mon, 26 Oct 2020 13:02:18 UTC +00:00>,
 #<Ingredient:0x00007ff779f2d050 id: 6, name: "Strawberry schnapps", created_at: Mon, 26 Oct 2020 13:02:18 UTC +00:00, updated_at: Mon, 26 Oct 2020 13:02:18 UTC +00:00>,
 #<Ingredient:0x00007ff779f2cec0 id: 7, name: "Scotch", created_at: Mon, 26 Oct 2020 13:02:18 UTC +00:00, updated_at: Mon, 26 Oct 2020 13:02:18 UTC +00:00>,
 #<Ingredient:0x00007ff779f2cd80 id: 8, name: "Apricot brandy", created_at: Mon, 26 Oct 2020 13:02:18 UTC +00:00, updated_at: Mon, 26 Oct 2020 13:02:18 UTC +00:00>,
 #<Ingredient:0x00007ff779f2ca10 id: 9, name: "Triple sec", created_at: Mon, 26 Oct 2020 13:02:18 UTC +00:00, updated_at: Mon, 26 Oct 2020 13:02:18 UTC +00:00>,
 #<Ingredient:0x00007ff779f2c628 id: 10, name: "Southern Comfort", created_at: Mon, 26 Oct 2020 13:02:18 UTC +00:00, updated_at: Mon, 26 Oct 2020 13:02:18 UTC +00:00>,
 #<Ingredient:0x00007ff779f2c268 id: 11, name: "Orange bitters", created_at: Mon, 26 Oct 2020 13:02:18 UTC +00:00, updated_at: Mon, 26 Oct 2020 13:02:18 UTC +00:00>,
 #<Ingredient:0x00007ff7772d7ed8 id: 12, name: "Brandy", created_at: Mon, 26 Oct 2020 13:02:18 UTC +00:00, updated_at: Mon, 26 Oct 2020 13:02:18 UTC +00:00>,
 #<Ingredient:0x00007ff7772d7d98 id: 13, name: "Lemon vodka", created_at: Mon, 26 Oct 2020 13:02:18 UTC +00:00, updated_at: Mon, 26 Oct 2020 13:02:18 UTC +00:00>,
 #<Ingredient:0x00007ff7772d79d8 id: 14, name: "Blended whiskey", created_at: Mon, 26 Oct 2020 13:02:18 UTC +00:00, updated_at: Mon, 26 Oct 2020 13:02:18 UTC +00:00>,
 #<Ingredient:0x00007ff7772d7280 id: 15, name: "Dry Vermouth", created_at: Mon, 26 Oct 2020 13:02:18 UTC +00:00, updated_at: Mon, 26 Oct 2020 13:02:18 UTC +00:00>,
 #<Ingredient:0x00007ff7772d6c40 id: 16, name: "Amaretto", created_at: Mon, 26 Oct 2020 13:02:18 UTC +00:00, updated_at: Mon, 26 Oct 2020 13:02:18 UTC +00:00>,
 #<Ingredient:0x00007ff7772d6a88 id: 17, name: "Tea", created_at: Mon, 26 Oct 2020 13:02:18 UTC +00:00, updated_at: Mon, 26 Oct 2020 13:02:18 UTC +00:00>,
 #<Ingredient:0x00007ff7772d65b0 id: 18, name: "Champagne", created_at: Mon, 26 Oct 2020 13:02:18 UTC +00:00, updated_at: Mon, 26 Oct 2020 13:02:18 UTC +00:00>,
 #<Ingredient:0x00007ff7772d6150 id: 19, name: "Coffee liqueur", created_at: Mon, 26 Oct 2020 13:02:18 UTC +00:00, updated_at: Mon, 26 Oct 2020 13:02:18 UTC +00:00>,
 #<Ingredient:0x00007ff7772d5e58 id: 20, name: "Bourbon", created_at: Mon, 26 Oct 2020 13:02:18 UTC +00:00, updated_at: Mon, 26 Oct 2020 13:02:18 UTC +00:00>,
 #<Ingredient:0x00007ff7772d57c8 id: 21, name: "Tequila", created_at: Mon, 26 Oct 2020 13:02:18 UTC +00:00, updated_at: Mon, 26 Oct 2020 13:02:18 UTC +00:00>,
 #<Ingredient:0x00007ff7772d54d0 id: 22, name: "Vodka", created_at: Mon, 26 Oct 2020 13:02:18 UTC +00:00, updated_at: Mon, 26 Oct 2020 13:02:18 UTC +00:00>,
 #<Ingredient:0x00007ff7772d5110 id: 23, name: "Añejo rum", created_at: Mon, 26 Oct 2020 13:02:18 UTC +00:00, updated_at: Mon, 26 Oct 2020 13:02:18 UTC +00:00>,
 #<Ingredient:0x00007ff7772d4e68 id: 24, name: "Bitters", created_at: Mon, 26 Oct 2020 13:02:18 UTC +00:00, updated_at: Mon, 26 Oct 2020 13:02:18 UTC +00:00>,
 #<Ingredient:0x00007ff7772d49e0 id: 25, name: "Sugar", created_at: Mon, 26 Oct 2020 13:02:18 UTC +00:00, updated_at: Mon, 26 Oct 2020 13:02:18 UTC +00:00>,
 #<Ingredient:0x00007ff7772d4530 id: 26, name: "Kahlua", created_at: Mon, 26 Oct 2020 13:02:18 UTC +00:00, updated_at: Mon, 26 Oct 2020 13:02:18 UTC +00:00>,
 #<Ingredient:0x00007ff7772d43c8 id: 27, name: "demerara Sugar", created_at: Mon, 26 Oct 2020 13:02:18 UTC +00:00, updated_at: Mon, 26 Oct 2020 13:02:18 UTC +00:00>,
 #<Ingredient:0x00007ff77b52fa88 id: 28, name: "Dubonnet Rouge", created_at: Mon, 26 Oct 2020 13:02:18 UTC +00:00, updated_at: Mon, 26 Oct 2020 13:02:18 UTC +00:00>,
 #<Ingredient:0x00007ff77b52ee30 id: 29, name: "Watermelon", created_at: Mon, 26 Oct 2020 13:02:18 UTC +00:00, updated_at: Mon, 26 Oct 2020 13:02:18 UTC +00:00>,
 #<Ingredient:0x00007ff77b52e8b8 id: 30, name: "Lime juice", created_at: Mon, 26 Oct 2020 13:02:18 UTC +00:00, updated_at: Mon, 26 Oct 2020 13:02:18 UTC +00:00>,
 #<Ingredient:0x00007ff77b52e610 id: 31, name: "Irish whiskey", created_at: Mon, 26 Oct 2020 13:02:18 UTC +00:00, updated_at: Mon, 26 Oct 2020 13:02:18 UTC +00:00>,
 #<Ingredient:0x00007ff77b52de90 id: 32, name: "Apple brandy", created_at: Mon, 26 Oct 2020 13:02:18 UTC +00:00, updated_at: Mon, 26 Oct 2020 13:02:18 UTC +00:00>,
 #<Ingredient:0x00007ff77b52dbc0 id: 33, name: "Carbonated water", created_at: Mon, 26 Oct 2020 13:02:18 UTC +00:00, updated_at: Mon, 26 Oct 2020 13:02:18 UTC +00:00>,
 #<Ingredient:0x00007ff77b52d828 id: 34, name: "Cherry brandy", created_at: Mon, 26 Oct 2020 13:02:18 UTC +00:00, updated_at: Mon, 26 Oct 2020 13:02:18 UTC +00:00>,
 #<Ingredient:0x00007ff77b52d5d0 id: 35, name: "Creme de Cacao", created_at: Mon, 26 Oct 2020 13:02:18 UTC +00:00, updated_at: Mon, 26 Oct 2020 13:02:18 UTC +00:00>,
 #<Ingredient:0x00007ff779f3fcc8 id: 36, name: "Grenadine", created_at: Mon, 26 Oct 2020 13:02:18 UTC +00:00, updated_at: Mon, 26 Oct 2020 13:02:18 UTC +00:00>,
 #<Ingredient:0x00007ff779f3ec60 id: 37, name: "Port", created_at: Mon, 26 Oct 2020 13:02:18 UTC +00:00, updated_at: Mon, 26 Oct 2020 13:02:18 UTC +00:00>,
 #<Ingredient:0x00007ff779f3e5f8 id: 38, name: "Coffee brandy", created_at: Mon, 26 Oct 2020 13:02:18 UTC +00:00, updated_at: Mon, 26 Oct 2020 13:02:18 UTC +00:00>,
 #<Ingredient:0x00007ff779f3e0f8 id: 39, name: "Red wine", created_at: Mon, 26 Oct 2020 13:02:18 UTC +00:00, updated_at: Mon, 26 Oct 2020 13:02:18 UTC +00:00>,
 #<Ingredient:0x00007ff779f3db58 id: 40, name: "Rum", created_at: Mon, 26 Oct 2020 13:02:18 UTC +00:00, updated_at: Mon, 26 Oct 2020 13:02:18 UTC +00:00>,
 #<Ingredient:0x00007ff779f3cb40 id: 41, name: "Grapefruit juice", created_at: Mon, 26 Oct 2020 13:02:18 UTC +00:00, updated_at: Mon, 26 Oct 2020 13:02:18 UTC +00:00>,
 #<Ingredient:0x00007ff779f3c9d8 id: 42, name: "Ricard", created_at: Mon, 26 Oct 2020 13:02:18 UTC +00:00, updated_at: Mon, 26 Oct 2020 13:02:18 UTC +00:00>,
 #<Ingredient:0x00007ff779f3c140 id: 43, name: "Sherry", created_at: Mon, 26 Oct 2020 13:02:18 UTC +00:00, updated_at: Mon, 26 Oct 2020 13:02:18 UTC +00:00>,
 #<Ingredient:0x00007ff779f56e28 id: 44, name: "Cognac", created_at: Mon, 26 Oct 2020 13:02:18 UTC +00:00, updated_at: Mon, 26 Oct 2020 13:02:18 UTC +00:00>,
 #<Ingredient:0x00007ff779f569a0 id: 45, name: "Sloe gin", created_at: Mon, 26 Oct 2020 13:02:18 UTC +00:00, updated_at: Mon, 26 Oct 2020 13:02:18 UTC +00:00>,
 #<Ingredient:0x00007ff779f566a8 id: 46, name: "Apple juice", created_at: Mon, 26 Oct 2020 13:02:18 UTC +00:00, updated_at: Mon, 26 Oct 2020 13:02:18 UTC +00:00>,
 #<Ingredient:0x00007ff779f56248 id: 47, name: "Pineapple juice", created_at: Mon, 26 Oct 2020 13:02:18 UTC +00:00, updated_at: Mon, 26 Oct 2020 13:02:18 UTC +00:00>,
 #<Ingredient:0x00007ff779f55e88 id: 48, name: "Lemon juice", created_at: Mon, 26 Oct 2020 13:02:18 UTC +00:00, updated_at: Mon, 26 Oct 2020 13:02:18 UTC +00:00>
#<Ingredient:0x00007ff779f55af0 id: 49, name: "Sugar syrup", created_at: Mon, 26 Oct 2020 13:02:18 UTC +00:00, updated_at: Mon, 26 Oct 2020 13:02:18 UTC +00:00>,
 #<Ingredient:0x00007ff779f55460 id: 50, name: "Milk", created_at: Mon, 26 Oct 2020 13:02:18 UTC +00:00, updated_at: Mon, 26 Oct 2020 13:02:18 UTC +00:00>,
 #<Ingredient:0x00007ff779f54f38 id: 51, name: "Strawberries", created_at: Mon, 26 Oct 2020 13:02:18 UTC +00:00, updated_at: Mon, 26 Oct 2020 13:02:18 UTC +00:00>,
 #<Ingredient:0x00007ff779f54ce0 id: 52, name: "Chocolate syrup", created_at: Mon, 26 Oct 2020 13:02:18 UTC +00:00, updated_at: Mon, 26 Oct 2020 13:02:18 UTC +00:00>,
 #<Ingredient:0x00007ff779f54b28 id: 53, name: "Yoghurt", created_at: Mon, 26 Oct 2020 13:02:18 UTC +00:00, updated_at: Mon, 26 Oct 2020 13:02:18 UTC +00:00>,
 #<Ingredient:0x00007ff779f54858 id: 54, name: "Mango", created_at: Mon, 26 Oct 2020 13:02:18 UTC +00:00, updated_at: Mon, 26 Oct 2020 13:02:18 UTC +00:00>,
 #<Ingredient:0x00007ff779f54650 id: 55, name: "Ginger", created_at: Mon, 26 Oct 2020 13:02:18 UTC +00:00, updated_at: Mon, 26 Oct 2020 13:02:18 UTC +00:00>,
 #<Ingredient:0x00007ff779f54240 id: 56, name: "Lime", created_at: Mon, 26 Oct 2020 13:02:18 UTC +00:00, updated_at: Mon, 26 Oct 2020 13:02:18 UTC +00:00>,
 #<Ingredient:0x00007ff77b537ee0 id: 57, name: "Cantaloupe", created_at: Mon, 26 Oct 2020 13:02:18 UTC +00:00, updated_at: Mon, 26 Oct 2020 13:02:18 UTC +00:00>,
 #<Ingredient:0x00007ff77b537d00 id: 58, name: "Berries", created_at: Mon, 26 Oct 2020 13:02:18 UTC +00:00, updated_at: Mon, 26 Oct 2020 13:02:18 UTC +00:00>,
 #<Ingredient:0x00007ff77b537b20 id: 59, name: "Grapes", created_at: Mon, 26 Oct 2020 13:02:18 UTC +00:00, updated_at: Mon, 26 Oct 2020 13:02:18 UTC +00:00>,
 #<Ingredient:0x00007ff77b5375a8 id: 60, name: "Kiwi", created_at: Mon, 26 Oct 2020 13:02:18 UTC +00:00, updated_at: Mon, 26 Oct 2020 13:02:18 UTC +00:00>,
 #<Ingredient:0x00007ff77b536f68 id: 61, name: "Tomato juice", created_at: Mon, 26 Oct 2020 13:02:18 UTC +00:00, updated_at: Mon, 26 Oct 2020 13:02:18 UTC +00:00>,
 #<Ingredient:0x00007ff77b536658 id: 62, name: "Cocoa powder", created_at: Mon, 26 Oct 2020 13:02:18 UTC +00:00, updated_at: Mon, 26 Oct 2020 13:02:18 UTC +00:00>,
 #<Ingredient:0x00007ff77b536180 id: 63, name: "Chocolate", created_at: Mon, 26 Oct 2020 13:02:18 UTC +00:00, updated_at: Mon, 26 Oct 2020 13:02:18 UTC +00:00>,
 #<Ingredient:0x00007ff77b535a28 id: 64, name: "Heavy cream", created_at: Mon, 26 Oct 2020 13:02:18 UTC +00:00, updated_at: Mon, 26 Oct 2020 13:02:18 UTC +00:00>,
 #<Ingredient:0x00007ff77b535190 id: 65, name: "Galliano", created_at: Mon, 26 Oct 2020 13:02:18 UTC +00:00, updated_at: Mon, 26 Oct 2020 13:02:18 UTC +00:00>,
 #<Ingredient:0x00007ff77b534a38 id: 66, name: "Peach Vodka", created_at: Mon, 26 Oct 2020 13:02:18 UTC +00:00, updated_at: Mon, 26 Oct 2020 13:02:18 UTC +00:00>,
 #<Ingredient:0x00007ff77b534628 id: 67, name: "Ouzo", created_at: Mon, 26 Oct 2020 13:02:18 UTC +00:00, updated_at: Mon, 26 Oct 2020 13:02:18 UTC +00:00>,
 #<Ingredient:0x00007ff77b534268 id: 68, name: "Coffee", created_at: Mon, 26 Oct 2020 13:02:18 UTC +00:00, updated_at: Mon, 26 Oct 2020 13:02:18 UTC +00:00>,
 #<Ingredient:0x00007ff7772e7dd8 id: 69, name: "Spiced rum", created_at: Mon, 26 Oct 2020 13:02:18 UTC +00:00, updated_at: Mon, 26 Oct 2020 13:02:18 UTC +00:00>,
 #<Ingredient:0x00007ff7772e7bd0 id: 70, name: "Water", created_at: Mon, 26 Oct 2020 13:02:18 UTC +00:00, updated_at: Mon, 26 Oct 2020 13:02:18 UTC +00:00>,
 #<Ingredient:0x00007ff7772e7950 id: 71, name: "Espresso", created_at: Mon, 26 Oct 2020 13:02:18 UTC +00:00, updated_at: Mon, 26 Oct 2020 13:02:18 UTC +00:00>,
 #<Ingredient:0x00007ff7772e7068 id: 72, name: "Angelica root", created_at: Mon, 26 Oct 2020 13:02:18 UTC +00:00, updated_at: Mon, 26 Oct 2020 13:02:18 UTC +00:00>,
 #<Ingredient:0x00007ff7772e74c8 id: 73, name: "Orange", created_at: Mon, 26 Oct 2020 13:02:18 UTC +00:00, updated_at: Mon, 26 Oct 2020 13:02:18 UTC +00:00>,
 #<Ingredient:0x00007ff77b550508 id: 74, name: "Cranberries", created_at: Mon, 26 Oct 2020 13:02:18 UTC +00:00, updated_at: Mon, 26 Oct 2020 13:02:18 UTC +00:00>,
 #<Ingredient:0x00007ff77b550080 id: 75, name: "Johnnie Walker", created_at: Mon, 26 Oct 2020 13:02:18 UTC +00:00, updated_at: Mon, 26 Oct 2020 13:02:18 UTC +00:00>,
 #<Ingredient:0x00007ff77a982618 id: 76, name: "Apple cider", created_at: Mon, 26 Oct 2020 13:02:18 UTC +00:00, updated_at: Mon, 26 Oct 2020 13:02:18 UTC +00:00>,
 #<Ingredient:0x00007ff77a982488 id: 77, name: "Everclear", created_at: Mon, 26 Oct 2020 13:02:18 UTC +00:00, updated_at: Mon, 26 Oct 2020 13:02:18 UTC +00:00>,
 #<Ingredient:0x00007ff77a9822a8 id: 78, name: "Cranberry juice", created_at: Mon, 26 Oct 2020 13:02:18 UTC +00:00, updated_at: Mon, 26 Oct 2020 13:02:18 UTC +00:00>,
 #<Ingredient:0x00007ff77a982140 id: 79, name: "Egg yolk", created_at: Mon, 26 Oct 2020 13:02:18 UTC +00:00, updated_at: Mon, 26 Oct 2020 13:02:18 UTC +00:00>,
 #<Ingredient:0x00007ff77a981e48 id: 80, name: "Egg", created_at: Mon, 26 Oct 2020 13:02:18 UTC +00:00, updated_at: Mon, 26 Oct 2020 13:02:18 UTC +00:00>,
 #<Ingredient:0x00007ff77a981b00 id: 81, name: "Grape juice", created_at: Mon, 26 Oct 2020 13:02:18 UTC +00:00, updated_at: Mon, 26 Oct 2020 13:02:18 UTC +00:00>,
 #<Ingredient:0x00007ff779f6eb40 id: 82, name: "Peach nectar", created_at: Mon, 26 Oct 2020 13:02:18 UTC +00:00, updated_at: Mon, 26 Oct 2020 13:02:18 UTC +00:00>,
 #<Ingredient:0x00007ff779f6cae8 id: 83, name: "Lemon", created_at: Mon, 26 Oct 2020 13:02:18 UTC +00:00, updated_at: Mon, 26 Oct 2020 13:02:18 UTC +00:00>,
 #<Ingredient:0x00007ff779f6c840 id: 84, name: "Firewater", created_at: Mon, 26 Oct 2020 13:02:18 UTC +00:00, updated_at: Mon, 26 Oct 2020 13:02:18 UTC +00:00>,
 #<Ingredient:0x00007ff779f6c728 id: 85, name: "Lemonade", created_at: Mon, 26 Oct 2020 13:02:18 UTC +00:00, updated_at: Mon, 26 Oct 2020 13:02:18 UTC +00:00>,
 #<Ingredient:0x00007ff779f6c278 id: 86, name: "Lager", created_at: Mon, 26 Oct 2020 13:02:18 UTC +00:00, updated_at: Mon, 26 Oct 2020 13:02:18 UTC +00:00>,
 #<Ingredient:0x00007ff779f6c1b0 id: 87, name: "Whiskey", created_at: Mon, 26 Oct 2020 13:02:18 UTC +00:00, updated_at: Mon, 26 Oct 2020 13:02:18 UTC +00:00>,
 #<Ingredient:0x00007ff77b54bda0 id: 88, name: "Absolut Citron", created_at: Mon, 26 Oct 2020 13:02:18 UTC +00:00, updated_at: Mon, 26 Oct 2020 13:02:18 UTC +00:00>,
 #<Ingredient:0x00007ff77b54bb70 id: 89, name: "Pisco", created_at: Mon, 26 Oct 2020 13:02:18 UTC +00:00, updated_at: Mon, 26 Oct 2020 13:02:18 UTC +00:00>,
 #<Ingredient:0x00007ff77b54b8a0 id: 90, name: "Irish cream", created_at: Mon, 26 Oct 2020 13:02:18 UTC +00:00, updated_at: Mon, 26 Oct 2020 13:02:18 UTC +00:00>,
 #<Ingredient:0x00007ff77b54b328 id: 91, name: "Ale", created_at: Mon, 26 Oct 2020 13:02:18 UTC +00:00, updated_at: Mon, 26 Oct 2020 13:02:18 UTC +00:00>,
 #<Ingredient:0x00007ff77b54b0a8 id: 92, name: "Chocolate liqueur", created_at: Mon, 26 Oct 2020 13:02:18 UTC +00:00, updated_at: Mon, 26 Oct 2020 13:02:18 UTC +00:00>,
 #<Ingredient:0x00007ff77b54aea0 id: 93, name: "Midori melon liqueur", created_at: Mon, 26 Oct 2020 13:02:18 UTC +00:00, updated_at: Mon, 26 Oct 2020 13:02:18 UTC +00:00>,
 #<Ingredient:0x00007ff77b54ac70 id: 94, name: "Sambuca", created_at: Mon, 26 Oct 2020 13:02:18 UTC +00:00, updated_at: Mon, 26 Oct 2020 13:02:18 UTC +00:00>,
 #<Ingredient:0x00007ff77b54aa40 id: 95, name: "Cider", created_at: Mon, 26 Oct 2020 13:02:18 UTC +00:00, updated_at: Mon, 26 Oct 2020 13:02:18 UTC +00:00>,
 #<Ingredient:0x00007ff77b54a608 id: 96, name: "Sprite", created_at: Mon, 26 Oct 2020 13:02:18 UTC +00:00, updated_at: Mon, 26 Oct 2020 13:02:18 UTC +00:00>,
 #<Ingredient:0x00007ff77b54a2e8 id: 97, name: "7-Up", created_at: Mon, 26 Oct 2020 13:02:18 UTC +00:00, updated_at: Mon, 26 Oct 2020 13:02:18 UTC +00:00>,
 #<Ingredient:0x00007ff77b54a0e0 id: 98, name: "Blackberry brandy", created_at: Mon, 26 Oct 2020 13:02:18 UTC +00:00, updated_at: Mon, 26 Oct 2020 13:02:18 UTC +00:00>,
 #<Ingredient:0x00007ff77b549ed8 id: 99, name: "Peppermint schnapps", created_at: Mon, 26 Oct 2020 13:02:18 UTC +00:00, updated_at: Mon, 26 Oct 2020 13:02:18 UTC +00:00>,
 #<Ingredient:0x00007ff77b549dc0 id: 100, name: "Creme de Cassis", created_at: Mon, 26 Oct 2020 13:02:18 UTC +00:00, updated_at: Mon, 26 Oct 2020 13:02:18 UTC +00:00>
