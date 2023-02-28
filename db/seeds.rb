# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

# Generate some users

puts "D-d-d-d-drop the database..."

Burger.delete_all
User.delete_all

puts "Generating 3 users"

3.times do
  user = User.new(
    username: Faker::Creature::Bird.anatomy,
    email: "#{Faker::Creature::Bird.anatomy}@gmail.com",
    password: "123456"
  )

  if user.valid?
    puts "Saving user #{user.username}"
    user.save
  else
    puts "Invalid user, not saving and moving on."
    puts user.errors.messages
  end
end

puts "Generating 10 burgers"
10.times do
  burger = Burger.new(
    description: Faker::Quotes::Shakespeare,
    name: "Burger #{Faker::Food.vegetables}",
    user_id: User.all.sample.id
  )

  if burger.valid?
    puts "Saving  burger #{burger.name}"
    burger.save
  else
    puts "Invalid user, not saving and moving on."
  end
end
