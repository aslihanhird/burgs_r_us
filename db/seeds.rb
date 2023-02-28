# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

# Generate some users

puts "--------------------------------"
puts "🤖🤘 > D-d-d-d-dropping the database ..."
puts "--------------------------------"
Review.delete_all
Burger.delete_all

puts "🤖 > I'll be nice, your users have not been deleted so you can re-use them."

puts "--------------------------------"
puts "Database cleared succesfully. ✅"
puts "--------------------------------"
puts "🤖 > Generating 3 users"
puts "--------------------------------"

3.times do
  username = Faker::Creature::Bird.anatomy
  user = User.new(
    username: username,
    email: "#{username}@gmail.com",
    password: "123456"
  )

  image = URI.open('https://picsum.photos/600')

  user.photo.attach(io: image, filename: "Profile picture", content_type: 'image/jpg')

  if user.valid?
    puts "Saving user #{user.username}"
    user.save
  else
    puts "Invalid user, not saving and moving on."
    puts user.errors.messages
  end
end

puts "Users generated succesfully ✅"
puts "--------------------------------"
puts "🤖 > Generating 10 burgers"
puts "--------------------------------"

10.times do
  burger = Burger.new(
    description: Faker::Quotes::Shakespeare.hamlet_quote,
    name: "Burger #{Faker::Food.vegetables}",
    user_id: User.all.sample.id
  )

  image = URI.open('https://picsum.photos/600')

  burger.photos.attach(io: image, filename: rand(1...5000), content_type: 'image/jpg')

  if burger.valid?
    puts "🤖 > Saving burger #{burger.name}"
    burger.save
  else
    puts "🤖 > Invalid user, not saving and moving on."
  end
end

puts "--------------------------------"
puts "Burgers generated succesfully ✅"
puts "--------------------------------"
puts "🤖 > Generating 3 to 5 reviews for every burger"
puts "--------------------------------"

# For every burger
Burger.all.each do |burger|
  # Create 3 to 5 reviews
  rand(3..5).times do
    review = Review.new(
      content: Faker::TvShows::GameOfThrones.quote,
      rating: rand(1..5),
      burger_id: burger.id,
      user_id: User.all.sample.id
    )

    if review.valid?
      review.save
      puts "🤖 > Review saved (ID: #{review.id})"
    else
      puts "🤖 > Invalid review, not saving and moving on."
    end
  end
end
puts "✅✅✅ Seed succesful. Back to coding!!! 😤"
