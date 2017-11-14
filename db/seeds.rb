# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
puts 'Creating categories...'
hair = Category.create!({
  name: "Hair"
})
skin = Category.create!({
  name: "Skin"
})
nails = Category.create!({
  name: "Nails"
})
body = Category.create!({
  name: "Body"
})
puts 'Categories added!'

# puts 'Creating subcategories...'

# puts 'Subcategories added!'

# Subcategory.new(subcategory)

subcategories_hair = ["Hair cut", "Hair removal", "Hair trimming / shaving", "Hair colouring", "Hair styling"]
subcategories_skin = ["Skin care", "Make-up"]
subcategories_nails = ["Manicure", "Pedicure"]
subcategories_body = ["Swedish massage therapy", "Aromatherapy massage", "hot stone massage", "deep tissue massage", "shiatsu massage", "thai massage", "pregnancy massage", "reflexology", "other"]

subcategories_hair.each do |subcategory_hair|
  subcategory_a = Subcategory.new(name: subcategory_hair)
  subcategory_a.category = hair
  subcategory_a.save
end

subcategories_skin.each do |subcategory_skin|
  subcategory_a = Subcategory.new(name: subcategory_skin)
  subcategory_a.category = skin
  subcategory_a.save
end

subcategories_nails.each do |subcategory_nails|
  subcategory_a = Subcategory.new(name: subcategory_nails)
  subcategory_a.category = nails
  subcategory_a.save
end

subcategories_body.each do |subcategory_body|
  subcategory_a = Subcategory.new(name: subcategory_body)
  subcategory_a.category = body
  subcategory_a.save
end
