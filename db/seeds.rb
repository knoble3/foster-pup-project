# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'open-uri'
require 'json'

url = "https://api.thedogapi.com/v1/images/search"


5.times do

    data = JSON.parse(open(url).read)


    unless data[0]['breeds'].empty?

    user = User.create!(email: Faker::Internet.email, password: 'password')

    dog = Dog.new(name: Faker::Creature::Dog.name, user: user)
    dog.breed = data[0]['breeds'][0]['name']
    dog.description = data[0]['breeds'][0]['temperament']
    # dog.photo.attach(io: URI.open(data[0]['url']), filename: 'dog.png', content_type: 'image/jpg')
    dog.save


    request = Request.create!(status: 'pending', content: Faker::Lorem.sentence(word_count:10), start_date: (Time.at(rand * Time.now.to_i)), end_date: Time.now, user: user, dog: dog)

    end
end






