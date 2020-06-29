# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

10.times do

    user = User.create!(email: Faker::Internet.email, password: 'password')

    dog = Dog.create!(name: Faker::Creature::Dog.name, breed: Faker::Creature::Dog.breed, age: rand(1..10), description: Faker::Lorem.sentence(word_count: 10), user: user)

    request = Request.create!(status: 'pending', content: Faker::Lorem.sentence(word_count:10), start_date: (Time.at(rand * Time.now.to_i)), end_date: Time.now, user: user, dog: dog)

end






