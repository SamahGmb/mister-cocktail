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

puts "Destroy Category ... "
Category.delete_all

puts "Destroy Users ... "
User.delete_all

puts "Creating Users ..."

michel = User.create!(email:'michel@gmail.com', password:'MichelMichel')

puts "Users OK!"

puts "Creating Categories ..."

alc_cat = Category.create!(name:'With Alcohol')
no_alc_cat = Category.create!(name:'Without Alcohol')

puts "Categories OK!"

puts "Creating Ingredients ..."

require 'json'
require 'open-uri'

url = 'https://www.thecocktaildb.com/api/json/v1/1/list.php?i=list'
drinks = open(url).read
ingredients = JSON.parse(drinks)

ingredients["drinks"].each do |ingredient|
  Ingredient.create!(name:"#{ingredient["strIngredient1"]}")
end

prosecco = Ingredient.create!(name:'Prosecco')
aperol = Ingredient.create!(name:'Aperol')
mint_leaves = Ingredient.create!(name:'Mint Leaves')
coconut_cream = Ingredient.create!(name:'Coconut Cream')
raspberry = Ingredient.create!(name:'Raspberry')

puts "Ingedients OK!"

puts "Creating Cocktails ... "

cosmopolitan = Cocktail.create!(name:'Cosmopolitan', category:alc_cat, user:michel, description:"Shake ingredients in a cocktail shaker with ice and strain into a cocktail glass. To make the garnish: hold a 3cm round piece of orange zest about 10cm above your cosmo and very carefully wave it over a lit match or lighter flame. Bend the outer edge of the zest in towards the flame so that the orange oils are released, then drop the zest into your drink.")
cosmopolitan_photo = URI.open('https://image.freepik.com/photos-gratuite/cocktail-au-zeste-orange_141793-1157.jpg')
cosmopolitan.photo.attach(io: cosmopolitan_photo, filename: 'cosmopolitan.jpg', content_type: 'image/jpg')

mojito = Cocktail.create!(name:'Mojito', category:alc_cat, user:michel, description:"Muddle the lime juice, sugar and mint leaves in a small jug, crushing the mint as you go – you can use the end of a rolling pin for this. Pour into a tall glass and add a handful of ice. Pour over the rum, stirring with a long-handled spoon. Top up with soda water, garnish with mint and serve.")
mojito_photo = URI.open('https://cdn.pixabay.com/photo/2018/06/28/18/11/mojito-3504486_1280.jpg')
mojito.photo.attach(io:mojito_photo , filename: 'mojito.jpg', content_type: 'image/jpg')

margarita = Cocktail.create!(name:'Margarita', category:alc_cat, user:michel, description:"Sprinkle a few teaspoons of salt over the surface of a small plate or saucer. Rub one wedge of lime along the rim of a tumbler and then dip it into the salt so that the entire rim is covered. Fill a cocktail shaker with ice, then add the tequila, lime juice and triple sec. Shake until the outside of the shaker feels cold. Strain the mix into the prepared glass over fresh ice. Serve with a wedge of lime.")
margarita_photo = URI.open('https://image.freepik.com/photos-gratuite/cocktail-classique-margarita-du-sel-bord-du-verre-soucoupe-table-blanche_23-2148283644.jpg')
margarita.photo.attach(io: margarita_photo, filename: 'margarita.jpg', content_type: 'image/jpg')

pina_colada = Cocktail.create!(name:'Piña Colada', category:alc_cat, user:michel, description:"Pulse all the ingredients along with a handful of ice in a blender until smooth. Pour into a tall glass and garnish as you like.")
pina_colada_photo = URI.open('https://image.freepik.com/photos-gratuite/cocktail-noix-coco-paille-palmier-plage_268835-1922.jpg')
pina_colada.photo.attach(io: pina_colada_photo, filename: 'pina-colada.jpg', content_type: 'image/jpg')

spritz = Cocktail.create!(name:'Aperol Spritz', category:alc_cat, user:michel, description:"Put a couple of cubes of ice into 2 glasses and add a 50 ml measure of Aperol to each. Divide the prosecco between the glasses and then top up with soda, if you like.")
spritz_photo = URI.open('https://image.freepik.com/photos-gratuite/verre-cocktail-martini-rouge-citron-fruits-rouges_176474-2509.jpg')
spritz.photo.attach(io: spritz_photo, filename: 'spritz.jpg', content_type: 'image/jpg')

dry_martini = Cocktail.create!(name:'Dry Martini', category:alc_cat, user:michel, description:"Put two martini glasses in the fridge to chill. Thread the olives onto two cocktail sticks and set aside. Fill a jug or mixing glass with the ice, then pour in the gin, vermouth and olive brine. Stir until the outside of the jug feels cold. Taste to make sure that it's icy cold and that you’re happy with the dilution. Strain the mix into the chilled glasses and garnish with the olive skewers.")
dry_martini_photo = URI.open('https://image.freepik.com/photos-gratuite/vue-laterale-martini-dans-verre-aux-olives_176474-2476.jpg')
dry_martini.photo.attach(io: dry_martini_photo, filename: 'dry_martini.jpg', content_type: 'image/jpg')

virgin_mojito = Cocktail.create!(name:'Virgin Mojito', category:no_alc_cat, user:michel, description:"Place mint leaves and lime juice in a glass and muddle them together. Muddling = mushing them up and crushing the leaves to release the flavor and oils the mint. Use a muddler or the handle of a wooden spoon. Or a set of brass knuckles. To each their own. Add the honey simple syrup. Add the sparkling water. Garnish with lime slices, a sprig of mint, and/or fresh fruit. ")
virgin_mojito_photo = URI.open('https://image.freepik.com/photos-gratuite/close-up-mojito-cocktail-menthe-citron-vert-glace-seau-glace-fumee_176474-2447.jpg')
virgin_mojito.photo.attach(io:virgin_mojito_photo , filename: 'virgin_mojito.jpg', content_type: 'image/jpg')

raspberry_lemonade = Cocktail.create!(name:'Raspberry Cocktail', category:no_alc_cat, user:michel, description:"An easy recipe for Raspberry Lemonade Fizz. Make this non-alcoholic beverage the “signature drink” at your next party! It only takes 3 ingredients and everything can be made ahead. And you can spike it if you want to!")
raspberry_lemonade_photo = URI.open('https://image.freepik.com/photos-gratuite/cocktail-framboises_23-2148371230.jpg')
raspberry_lemonade.photo.attach(io:raspberry_lemonade_photo , filename: 'raspberry_lemonade.jpg', content_type: 'image/jpg')

puts "Cocktails OK!"

puts "Creating Doses ... "

cosmo_lemon_vodka = Dose.create!(cocktail:cosmopolitan, ingredient_id:13, amount:45, unit:"ml")
cosmo_triple_sec = Dose.create!(cocktail:cosmopolitan, ingredient_id:9, amount:15, unit:"ml")
cosmo_lime_juice = Dose.create!(cocktail:cosmopolitan, ingredient_id:30, amount:10, unit:"ml")
cosmo_cramberry_juice = Dose.create!(cocktail:cosmopolitan, ingredient_id:78, amount:20, unit:"ml")
cosmo_orange = Dose.create!(cocktail:cosmopolitan, ingredient_id:73, amount:1, unit:"slice")

mojito_lime = Dose.create!(cocktail:mojito, ingredient_id:56, amount:1, unit:"unit")
mojito_sugar = Dose.create!(cocktail:mojito, ingredient_id:25, amount:5, unit:"ml")
mojito_rum = Dose.create!(cocktail:mojito, ingredient_id:40, amount:60, unit:"ml")
mojito_carbonated_water = Dose.create!(cocktail:mojito, ingredient_id:33, amount:60, unit:"ml")
mojito_mint_leaves = Dose.create!(cocktail:mojito, ingredient:mint_leaves, amount:10, unit:"unit")

margarita_tequila = Dose.create!(cocktail:margarita, ingredient_id:21, amount:50, unit:"ml")
margarita_lime_juice = Dose.create!(cocktail:margarita, ingredient_id:30, amount:25, unit:"ml")
margarita_triple_sec = Dose.create!(cocktail:margarita, ingredient_id:9, amount:20, unit:"ml")

pina_colada_rum = Dose.create!(cocktail:pina_colada, ingredient_id:40, amount:60, unit:"ml")
pina_colada_pineapple_juice = Dose.create!(cocktail:pina_colada, ingredient_id:47, amount:60, unit:"ml")
pina_colada_coconut_cream = Dose.create!(cocktail:pina_colada, ingredient:coconut_cream, amount:60, unit:"ml")

spritz_prosecco = Dose.create!(cocktail:spritz, ingredient:prosecco, amount:60, unit:"ml")
spritz_carbonated_water = Dose.create!(cocktail:spritz, ingredient_id:33, amount:20, unit:"ml")
spritz_aperol = Dose.create!(cocktail:spritz, ingredient:aperol, amount:40, unit:"ml")
spritz_orange = Dose.create!(cocktail:spritz, ingredient_id:73, amount:1, unit:"slice")

dry_martini_gin = Dose.create!(cocktail:dry_martini, ingredient_id:3, amount:50, unit:"ml")
dry_martini_dry_vermouth = Dose.create!(cocktail:dry_martini, ingredient_id:15, amount:10, unit:"ml")

virgin_mojito_mint_leaves = Dose.create!(cocktail:virgin_mojito, ingredient:mint_leaves, amount:15, unit:"unit")
virgin_mojito_sugar = Dose.create!(cocktail:virgin_mojito, ingredient_id:25, amount:15, unit:"ml")
virgin_mojito_lime_juice = Dose.create!(cocktail:virgin_mojito, ingredient_id:30, amount:30, unit:"ml")
virgin_mojito_carbonated_water = Dose.create!(cocktail:virgin_mojito, ingredient_id:33, amount:120, unit:"ml")
virgin_mojito_sugar_syrup = Dose.create!(cocktail:virgin_mojito, ingredient_id:49, amount:15, unit:"ml")
virgin_mojito_lime = Dose.create!(cocktail:virgin_mojito, ingredient_id:56, amount:1, unit:"unit")

raspberry_lemonade_raspberry = Dose.create!(cocktail:raspberry_lemonade, ingredient:raspberry, amount:8, unit:"unit")
raspberry_lemonade_mint_leaves = Dose.create!(cocktail:raspberry_lemonade, ingredient:mint_leaves, amount:6, unit:"unit")
raspberry_lemonade_lime_juice = Dose.create!(cocktail:raspberry_lemonade, ingredient_id:30, amount:50, unit:"ml")
raspberry_lemonade_sugar_syrup = Dose.create!(cocktail:raspberry_lemonade, ingredient_id:49, amount:50, unit:"ml")
raspberry_lemonade_carbonated_water = Dose.create!(cocktail:raspberry_lemonade, ingredient_id:33, amount:120, unit:"ml")
raspberry_lemonade_lime = Dose.create!(cocktail:raspberry_lemonade, ingredient_id:56, amount:1, unit:"slice")

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
