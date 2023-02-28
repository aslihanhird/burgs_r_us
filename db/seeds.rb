# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

# Generate some users

puts "--------------------------------"
puts "D-d-d-d-dropping the database..."
puts "--------------------------------"
Burger.delete_all
User.delete_all

puts "Database cleared succesfully."

puts "--------------------------------"
puts "Generating 3 users"
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

puts "Users generated succesfully"
puts "--------------------------------"
puts "Generating 10 burgers"
puts "--------------------------------"

10.times do
  burger = Burger.new(
    description: Faker::Quotes::Shakespeare.hamlet_quote,
    name: "Burger #{Faker::Food.vegetables}",
    user_id: User.all.sample.id
  )

  image = URI.open('https://picsum.photos/600')

  burger.photo.attach(io: image, filename: rand(1...5000), content_type: 'image/jpg')

  if burger.valid?
    puts "Saving burger #{burger.name}"
    burger.save
  else
    puts "Invalid user, not saving and moving on."
  end
end

puts "--------------------------------"
puts "Burgers generated succesfully"
puts "--------------------------------"
puts "✅✅✅ Seed succesful. Back to coding!!! 😤"
