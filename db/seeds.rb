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

# # scrape from https://www.yescapa.com/rent-a-private-motorhome/?seats=2&beds=2#

# # name = class="ng-binding"
# # picture url = img-responsive lazyloaded, src = ""

# require "open-uri"
# require "nokogiri"

# url = "https://www.goboony.nl/camper-huren-breda"
# # page not easy to scrape because the javascript changes the html


# html_file = URI.open(url).read
# html_doc = Nokogiri::HTML(html_file)

# array_url_picture = []
# array_name = []

# byebug

# html_doc.search(".title").each do |element|
#   array_name << element.text.strip
# end

# html_doc.search(".listing_photo").each do |element|
#   array_url_picture << element.attribute("data-src").value
# end
brands = ["Hippie campers", "BMW-Campers", "Volkswagen-Campers", "Holiday-Campers"]
src_pictures_campers = ["../app/assets/images/campers_seed/camper1.jpeg", "../app/assets/images/campers_seed/camper2.jpeg", "../app/assets/images/campers_seed/camper3.jpeg", "../app/assets/images/campers_seed/camper4.jpeg", "../app/assets/images/campers_seed/camper5.jpeg", "../app/assets/images/campers_seed/camper6.jpeg", "../app/assets/images/campers_seed/camper7.jpeg", "../app/assets/images/campers_seed/camper8.jpeg", "../app/assets/images/campers_seed/camper9.jpeg", "../app/assets/images/campers_seed/camper10.jpeg"]
names_campers = ["The Best Camper", "Modern Camper", "Traditional Camper", "Awesome camper 700", "Falling apart camper", "Barely functional camper", "Dangerous camper", "Your camper for the road", "Best motorhome camper"]
description_campers = ["Super nice camper with lots of space insicde", "Kinda small camper, but still drives amazing", "Might break down on the road, but that's why you can sleep inside!"]
passwords = ["pgh4iqhpg489q", "2r9pjfkae", "3j3231r83p", "fejiagp3hq2g", "feipaqgh3", "139r32f", "3fe2qrf32rr8f"]

10.times do
  user = User.new(
    email: Faker::Internet.email,
    password: passwords.sample,
    # encrypted_password is the same as password
  )
  user.save!
  offer = Offer.new(
    user_id: user.id,
    brand: brands.sample,
    description: description_campers.sample,
    availiblity_start_date: Faker::Date.between(from: '2022-08-23', to: '2014-09-25'),
    availibility_end_date: Faker::Date.between(from: '2022-09-25', to: '2022-11-25'),
    price: rand(1000..9000),
    name: names_campers.sample,
    picture_url: src_pictures_campers.sample
  )
  offer.save!
  booking = Booking.new(
    user_id: user.id,
    offer_id: offer.id,
    start_date: Faker::Date.between(from: '2022-08-23', to: '2014-09-25'),
    end_date: Faker::Date.between(from: '2022-09-25', to: '2022-11-25'),
    final_price: rand(9000..99000)
  )
  booking.save!
  end

puts "Finished creating!"
