# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

require 'faker'

puts "Cleaning databases..."
Booking.destroy_all
Offer.destroy_all
puts "Creating..."

10.times do
  user = User.new(
    email: Faker::Internet.email,
    password: ["pgh4iqhpg489q", "2r9pjfkae", "3j3231r83p", "fejiagp3hq2g", "feipaqgh3", "139r32f", "3fe2qrf32rr8f"].sample,
    # encrypted_password is the same as password
  )
  user.save!
  offer = Offer.new(
    user_id: user.id,
    brand: ["Hippie campers", "BMW-Campers", "Volkswagen-Campers", "Holiday-Campers"].sample,
    description: ["Super nice camper with lots of space insicde", "Kinda small camper, but still drives amazing", "Might break down on the road, but that's why you can sleep inside!"].sample,
    availiblity_start_date: Faker::Date.between(from: '2022-08-23', to: '2014-09-25'),
    availibility_end_date: Faker::Date.between(from: '2022-09-25', to: '2022-11-25'),
    price: rand(9000..99000)
  )
  offer.save!
  booking = Booking.new(
    user_id: user.id,
    offer_id: offer.id,
    start_date: Faker::Date.between(from: '2022-08-23', to: '2014-09-25'),
    end_date: Faker::Date.between(from: '2022-09-25', to: '2022-11-25'),
    final_price: rand(1000..9000)
  )
  booking.save!
  end

puts "Finished creating!"
