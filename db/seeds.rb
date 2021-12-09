# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'

Restaurant.destroy_all

puts 'Creating 5 fake Restaurants...'
5.times do
  restaurant = Restaurant.new(
    name: Faker::Restaurant.name,
    address: Faker::Address.full_address,
    phone_number: Faker::PhoneNumber.phone_number,
    category: Restaurant::CATEGORIES.sample
  )
  restaurant.save!
end
puts 'Finished!'

# https://github.com/faker-ruby/faker/blob/master/doc/default/restaurant.md


puts 'Creating 5 fake Reviews...'
5.times do
  review = Review.new(
    content: Faker::Restaurant.review,
    rating: rand(0..5),
    restaurant_id: Restaurant.ids.sample
  )
  review.save!
end
puts 'Finished!'
# Faker::Restaurant.review        #=> "Brand new. Great design. Odd to hear pop music in a Mexican establishment. Music is a bit loud. It should be background."
