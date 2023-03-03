puts "--------------------------------"
puts "🤖🤘 > D-d-d-d-dropping the database ..."
puts "--------------------------------"

Review.delete_all
Booking.delete_all
Burger.delete_all
User.delete_all

puts "--------------------------------"
puts "❌ Database deleted"
puts "--------------------------------"

puts "--------------------------------"
puts "🤖 > Generating 10 random users"
puts "--------------------------------"

10.times do
  random_name = Faker::Creature::Horse.name
  user = User.new(
    username: random_name,
    email: "#{random_name}@gmail.com",
    password: "123456"
  )
  url = URI.open('https://picsum.photos/600')
  user.photo.attach(io: url, filename: "Profile picture", content_type: 'image/jpg')

  if user.save
    puts "#{user.username} saved succesfully."
  else
    puts "Saving failed. Errors:"
    puts user.errors.messages
  end
end

puts "--------------------------------"
puts "🤖 > Generating 2 main users"
puts "--------------------------------"

user1 = User.new(
  username: "booker",
  email: "booker@gmail.com",
  password: "123456"
)

user2 = User.new(
  username: "owner",
  email: "owner@gmail.com",
  password: "123456"
)

if user1.save
  puts "#{user1.username} saved succesfully."
else
  puts "#{user1.username} has errors:"
  puts "#{user1.errors.messages}"
end

if user2.save
  puts "#{user2.username} saved succesfully."
else
  puts "#{user2.username} has errors:"
  puts "#{user2.errors.messages}"
end

puts "--------------------------------"
puts "✅ Users created succesfully"
puts "--------------------------------"


puts "--------------------------------"
puts "🤖 > Generating burgers 🍔"
puts "--------------------------------"

burger = Burger.new(
  name: "Classic Bicky Burger",
  description: "The most burger of burgers: the classic Bicky Burger.",
  price: (rand * 10).round(2)
)

burger.user = User.where(email: "owner@gmail.com")[0]

path = File.open("app/assets/images/seeds/bicky burger.png", "rb")

burger.photos.attach(io: path, filename: "Bicky Burger", content_type: 'image/png')

if burger.save
  puts "#{burger.name} saved succesfully."
else
  puts "Failed saving..."
  puts burger.errors.messages
end

puts "--------------------------------"

burger = Burger.new(
  name: "Luxurious beef burger ✨",
  description: "This burger is fancy as hell. It's a wonder that it isn't coated in gold. \n I'd say the taste is delicious but this burger is only up for rent and can't be eaten.",
  price: (rand * 10).round(2)
)

burger.user = User.where(email: "owner@gmail.com")[0]

path = File.open("app/assets/images/seeds/Fancy hamburger.jpg", "rb")

burger.photos.attach(io: path, filename: "Fancy burger", content_type: 'image/jpg')

if burger.save
  puts "#{burger.name} saved succesfully."
else
  puts "Failed saving..."
  puts burger.errors.messages
end

puts "--------------------------------"

burger = Burger.new(
  name: "Black sesame burger with calamari",
  description: "I bought this burger in Bilbao but never touched it. It looked delicious but I wasn't hungry. Now it's so old it can only be used to display in your house. \n Rent this burger now, you won't regret it! 🤞",
  price: (rand * 10).round(2)
)

burger.user = User.where(email: "owner@gmail.com")[0]

path = File.open("app/assets/images/seeds/Black sesame burger.jpg", "rb")

burger.photos.attach(io: path, filename: "Black sesame burger", content_type: 'image/jpg')

if burger.save
  puts "#{burger.name} saved succesfully."
else
  puts "Failed saving..."
  puts burger.errors.messages
end

puts "--------------------------------"

burger = Burger.new(
  name: "McDonalds McChicken",
  description: "A McChicken is a mildly spicy breaded and seasoned chicken sandwich which is also offered in a spicier variant (the Hot n' Spicy) in some markets. \nThe sandwich is made from 100% ground white meat chicken, mayonnaise, and shredded lettuce, on a toasted bun.",
  price: (rand * 10).round(2)
)

burger.user = User.where(email: "owner@gmail.com")[0]

path = File.open("app/assets/images/seeds/McChicken Burger.jpeg", "rb")

burger.photos.attach(io: path, filename: "McChicken", content_type: 'image/jpg')

if burger.save
  puts "#{burger.name} saved succesfully."
else
  puts "Failed saving..."
  puts burger.errors.messages
end

puts "--------------------------------"

burger = Burger.new(
  name: "Good old classic burger",
  description: "Nothing beats a good old classic. This burger has all it needs and nothing more. Cheese, salad & sauce are all presents! Rent this burger now and display it at your house to show-off to your friends and family.",
  price: (rand * 10).round(2)
)

burger.user = User.where(email: "owner@gmail.com")[0]

path = File.open("app/assets/images/seeds/Regular hamburger.jpg", "rb")

burger.photos.attach(io: path, filename: "Regular", content_type: 'image/jpg')

if burger.save
  puts "#{burger.name} saved succesfully."
else
  puts "Failed saving..."
  puts burger.errors.messages
end

puts "--------------------------------"

burger = Burger.new(
  name: "Size means everything-burger",
  description: "THE BIGGER THE BETTER. RENT THIS BURGER NOW AND SHOW EVERYONE THAT LESS IT NOT MORE.",
  price: (rand * 10).round(2)
)

burger.user = User.where(email: "owner@gmail.com")[0]

path = File.open("app/assets/images/seeds/amirali-mirhashemian-j-MPEwH9LM4-unsplash.jpg", "rb")

burger.photos.attach(io: path, filename: "Size means everything", content_type: 'image/jpg')

if burger.save
  puts "#{burger.name} saved succesfully."
else
  puts "Failed saving..."
  puts burger.errors.messages
end

puts "--------------------------------"

burger = Burger.new(
  name: "Vegan tofu burger",
  description: "Enjoy this no-meat burger and display it in your house with pride!",
  price: (rand * 10).round(2)
)

burger.user = User.where(email: "owner@gmail.com")[0]

path = File.open("app/assets/images/seeds/vegan-tofu-veggie-burgers-recipe-3377169-step-07-774b33dd9e734ebfa5739e3e5125ebf9.jpg", "rb")

burger.photos.attach(io: path, filename: "Size means everything", content_type: 'image/jpg')

if burger.save
  puts "#{burger.name} saved succesfully."
else
  puts "Failed saving..."
  puts burger.errors.messages
end

puts "--------------------------------"

burger = Burger.new(
  name: "Quick Giant",
  description: "The one and only Giant Burger from Quick!",
  price: (rand * 10).round(2)
)

burger.user = User.where(email: "owner@gmail.com")[0]

path = File.open("app/assets/images/seeds/giant-menu.png", "rb")

burger.photos.attach(io: path, filename: "giant", content_type: 'image/png')

if burger.save
  puts "#{burger.name} saved succesfully."
else
  puts "Failed saving..."
  puts burger.errors.messages
end

puts "--------------------------------"
puts "Burgers created succesfully ✅"
puts "--------------------------------"
puts "--------------------------------"
puts "🤖 > Generating bookings"
puts "--------------------------------"

puts "Bookings in the past:"
puts "--------------------------------"

Burger.all.each do |burger|
  start_date = Date.today - rand(1..10)
  end_date = start_date + rand(1..10)

  booking = Booking.new(
    start_date: start_date,
    end_date: end_date
  )

  booking.user = User.all.sample
  booking.burger = burger

  if booking.save(validate: false)
    puts "Booking (ID: #{booking.id}) saved succesfully."
  else
    puts "Failed saving..."
    puts booking.errors.messages
  end
end

# Bookings further in the past

Burger.all.each do |each_burger|
  start_date = Date.today - rand(30..60)
  end_date = start_date + rand(1..10)

  booking = Booking.new(
    start_date: start_date,
    end_date: end_date
  )

  booking.user = User.all.sample
  booking.burger = each_burger

  if booking.save(validate: false)
    puts "Booking (ID: #{booking.id}) saved succesfully."
  else
    puts "Failed saving..."
    puts booking.errors.messages
  end
end

# Bookings even further in the past

Burger.all.each do |each_burger|
  start_date = Date.today - rand(200..365)
  end_date = start_date + rand(1..10)

  booking = Booking.new(
    start_date: start_date,
    end_date: end_date
  )

  booking.user = User.all.sample
  booking.burger = each_burger

  if booking.save(validate: false)
    puts "Booking (ID: #{booking.id}) saved succesfully."
  else
    puts "Failed saving..."
    puts booking.errors.messages
  end
end

puts "--------------------------------"
puts "Bookings in the near future:"
puts "--------------------------------"

Burger.all.each do |each_burger|
  start_date = Date.today + rand(1..10)
  end_date = start_date + rand(1..10)

  booking = Booking.new(
    start_date: start_date,
    end_date: end_date
  )

  booking.user = User.all.sample
  booking.burger = each_burger

  if booking.save
    puts "Booking (ID: #{booking.id}) saved succesfully."
  else
    puts "Failed saving..."
    puts booking.errors.messages
  end
end

puts "--------------------------------"
puts "Random bookings far in the future"
puts "--------------------------------"

Burger.all.each do |each_burger|
  5.times do
    random_chance = rand(1..10)

    next if random_chance > 5

    start_date = Date.today + rand(30..100)
    end_date = start_date + rand(1..12)

    booking = Booking.new(
      start_date: start_date,
      end_date: end_date
    )

    booking.user = User.all.sample
    booking.burger = each_burger

    if booking.save
      puts "Random booking (ID: #{booking.id}) saved succesfully."
    else
      puts "Failed saving..."
      puts booking.errors.messages
    end
  end

end

puts "--------------------------------"
puts "Bookings created succesfully. ✅"
puts "--------------------------------"
puts "🤖 > Generating  positive reviews"
puts "--------------------------------"

Booking.all.each do |booking|
  review_chance = rand

  # Random chance if user writes a review
  next if review_chance < 0.3

  # If the bookings end date is not past yet, don't review
  next if booking.end_date >= Date.today

  review = Review.new(
    content: Faker::Movies::StarWars.wookiee_sentence,
  )

  positive_chance = rand

  if positive_chance > 0.3
    review.rating = rand(3..5)
  else
    review.rating = rand(1..3)
  end

  review.burger = booking.burger
  review.user = booking.user

  if review.save
    puts "Review (ID: #{review.id}) saved succesfully"
  else
    puts "Failed saving..."
    puts review.errors.messages
  end
end

puts "--------------------------------"
puts "🤖 > Generating demo account demo@lewagon.com"
puts "--------------------------------"

demo_user = User.new(
  username: "davydegr",
  email: "demo@lewagon.com",
  password: "123456"
)

if demo_user.save
  puts "Demo user saved succesfully."
end

demo_booking_past = Booking.new(
  start_date: Date.today - 365,
  end_date: Date.today - 350
)

demo_booking_past.burger = Burger.all.sample
demo_booking_past.user = demo_user

if demo_booking_past.save(validate: false)
  puts "Demo booking saved succesfully!"
else
  puts demo_booking_past.errors.messages
end

demo_booking_future = Booking.new(
  start_date: Date.today + 365,
  end_date: Date.today + 375
)

demo_booking_future.burger = Burger.all.sample
demo_booking_future.user = demo_user

if demo_booking_future.save
  puts "Demo booking saved succesfully!"
else
  puts demo_booking_past.errors.messages
end


puts "✅✅✅ Seed succesful. Back to coding!!! 😤"
