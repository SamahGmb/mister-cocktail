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

cosmopolitan = Cocktail.create!(name:'Cosmopolitan', description:"The tangy concoction of vodka, triple sec, lime juice and cranberry juice has managed to leapfrog the venerable screwdriver as many vodka drinkers prefer the Cosmopolitan’s cleaner and slightly tart taste. The keys to the preparation of a Cosmopolitan are a good brand of cranberry juice and Cointreau Triple Sec, two essential elements to the drink.")
mojito = Cocktail.create!(name:'Mojito', description:"The Mojito complimenting summer perfectly with a fresh minty taste. The mixture of white rum, mint, lime juice, sugar and soda water is crisp and clean with a relatively low alcohol content, the soda water can be replaced with sprite or 7-up. When preparing a mojito always crush the mint leaves as opposed to dicing to unlock oils that will assist with enhancing the minty flavour.")
mai_tai = Cocktail.create!(name:'Mai Tai', description:"The Mai Tai is a Polynesian-style cocktail that has a fruity tropical taste sweet and vibrant. The mixture of light and dark rum, orange curacao, orgeat syrup and lime juice has been a symbol of Tahitian culture ever since the drink was first created.")
mint_julep = Cocktail.create!(name:'Mint Julep', description:"The concoction of Bourbon, a little bit of water, powdered and granulated sugar and plenty of mint has long been a very popular way to drink a cocktail. Simple yet refined.")
caipirinha = Cocktail.create!(name:'Caipirinha', description:"Originally based on a remedy to cure Spanish flu, the national drink of Brazil is made with cachaca (spirit from a sugar cane) or white rum/vodka, brown sugar and lime juice.")
margarita = Cocktail.create!(name:'Margarita', description:"The simple mixture of tequila, triple sec and lime juice is often blended with ice but is traditionally served on the rocks. The cocktail is generally presented in a salt rimmed glass. Various fruity versions have been adapted from the traditional lime, such as raspberry, peach and strawberry.")
pina_colada = Cocktail.create!(name:'Piña Colada', description:"The classic tropical cocktail, with a distinctive look and taste. More of a smoothie as opposed to an alcoholic beverage. The modest yet perfect blend of coconut milk, rum and pineapple juice has been a firm favourite throughout the years.")
californication = Cocktail.create!(name:'Californication', description:"Californication as used by the Red Hot Chili Peppers means the mixing of different cultures. The cocktail reflects this with the various spirits used within the cocktail from all over the world. A mixture of run, vodka, tequila and gin finished with orange liqueur, lemon juice and orange juice to mask the various spirits used throughout. Strong and yet sweet. The cocktail is finished with either a slice of orange or a twisted peel of orange rind.")
long_island_iced_tea = Cocktail.create!(name:'Long Island Iced Tea', description:"A cocktail that never seems to go out of style. The potent concoction of rum, tequila, vodka, gin and triple sec finished with a mixture of sweet and sour cola and lemon juice. Tea isn't actually an addition to the drink, but the ingredients used predominantly the cola, provide the profile of tea with much more flavour.")
apple_martini = Cocktail.create!(name:'Apple Martini', description:"The Apple Martini or “Appletini” adds a twist to the typical dry martini. Vodka is used as opposed to gin as the basis of the cocktail and apple schnapps is added for a sweet but slightly sour twist. The cocktail is usually finished with lemon juice and garnished with a slice of apple, simple but tasty.")

puts "Cocktails created!"

# Ingedients

# Light rum
# Applejack
# Gin
# Dark rum
# Sweet Vermouth
# Strawberry schnapps
# Scotch
# Apricot brandy
# Triple sec
# Southern Comfort
# Orange bitters
# Brandy
# Lemon vodka
# Blended whiskey
# Dry Vermouth
# Amaretto
# Tea
# Champagne
# Coffee liqueur
# Bourbon
# Tequila
# Vodka
# Añejo rum
# Bitters
# Sugar
# Kahlua
# demerara Sugar
# Dubonnet Rouge
# Watermelon
# Lime juice
# Irish whiskey
# Apple brandy
# Carbonated water
# Cherry brandy
# Creme de Cacao
# Grenadine
# Port
# Coffee brandy
# Red wine
# Rum
# Grapefruit juice
# Ricard
# Sherry
# Cognac
# Sloe gin
# Apple juice
# Pineapple juice
# Lemon juice
# Sugar syrup
# Milk
# Strawberries
# Chocolate syrup
# Yoghurt
# Mango
# Ginger
# Lime
# Cantaloupe
# Berries
# Grapes
# Kiwi
# Tomato juice
# Cocoa powder
# Chocolate
# Heavy cream
# Galliano
# Peach Vodka
# Ouzo
# Coffee
# Spiced rum
# Water
# Espresso
# Angelica root
# Orange
# Cranberries
# Johnnie Walker
# Apple cider
# Everclear
# Cranberry juice
# Egg yolk
# Egg
# Grape juice
# Peach nectar
# Lemon
# Firewater
# Lemonade
# Lager
# Whiskey
# Absolut Citron
# Pisco
# Irish cream
# Ale
# Chocolate liqueur
# Midori melon liqueur
# Sambuca
# Cider
# Sprite
# 7-Up
# Blackberry brandy
# Peppermint schnapps
# Creme de Cassis
