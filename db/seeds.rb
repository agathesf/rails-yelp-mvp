# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require "faker"

# TODO: Write a seed to insert 100 posts in the database

Review.destroy_all
Restaurant.destroy_all

10.times do
  @restaurant = Restaurant.new(
    name: Faker::Restaurant.name,
    address: Faker::Address.city,
    phone_number: Faker::PhoneNumber.phone_number_with_country_code,
    category: ['chinese', 'italian', 'japanese', 'french', 'belgian'].sample
  )
  rand(5).times do
    @review = Review.new(
      restaurant: @restaurant,
      content: Faker::Restaurant.review,
      rating: rand(5)
    )
    @review.save
  end
  # @restaurant.reviews = @review
  @restaurant.save
end
