# category seed
puts 'Creating categories...'
hair = Category.new({ name: "Hair" })
hair.save

skin = Category.new({ name: "Skin" })
skin.save

nails = Category.new({ name: "Nails" })
nails.save

body = Category.new({ name: "Body" })
body.save
puts 'Categories added!'

# subcategory seed
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

# specialist seed
5.times do
  specialist = Specialist.new()
end

# treatment seed

