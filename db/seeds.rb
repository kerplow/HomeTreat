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

# client seed
5.times do
  client = Client.new({ first_name: Faker::Name.first_name, last_name: Faker::Name.last_name })
  client.email = Faker::Internet.email
  client.password = 'password'
  client.password_confirmation = 'password'
  client.save!
end

bios = ["I'm young, friendly, and eager to earn a little on the side", "I'm selfish and like bold man, but Make-up is my true passion", "If you can do my hair I'll work for free", "My dog is hairy and ugly, so I'm fine with any hairstyle", "Beware, I like to listen to heavy metal during my work"]

# specialist seed
review_titles = ["nice", "perfect", "loved it", "superb", "smells funny", "treated me real good"]
clients = Client.all
subcategories = Subcategory.all
10.times do
  specialist = Specialist.new({ first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, address: Faker::Address.street_address, bio: bios.sample, rating: (0..5).to_a.sample })
  specialist.email = Faker::Internet.email
  specialist.password = 'password'
  specialist.password_confirmation = 'password'
  # treatment seed
  (1..10).to_a.sample.times do
    treatment = Treatment.new({ description: Faker::Dessert.variety, price: rand(5..30), duration: rand(5..60), segment: 'everyone' })
    treatment.specialist = specialist
    treatment.subcategory = subcategories.sample
    treatment.save
  end
  # review seed
  (1..10).to_a.sample.times do
    review = Review.new({ title: review_titles.sample, content: Faker::MostInterestingManInTheWorld.quote, rating: rand(0..5) })
    review.specialist = specialist
    review.client = clients.sample
    review.save!
  end
  specialist.save!
end



