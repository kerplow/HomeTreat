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

subcategories = Subcategory.all
# specialist seed
10.times do
  specialist = Specialist.new({ first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, address: Faker::Address.street_address, bio: Faker::MostInterestingManInTheWorld.quote, rating: (0..5).to_a.sample })
  specialist.email = Faker::Internet.email
  specialist.password = 'password'
  specialist.password_confirmation = 'password'
  (1..10).to_a.sample.times do
    treatment = Treatment.new({ description: Faker::Dessert.variety, price: rand(5..30), duration: rand(5..60), segment: 'everyone' })
    treatment.specialist = specialist
    treatment.subcategory = subcategories.sample
    treatment.save
  end
  specialist.save!
end

# treatment seed

