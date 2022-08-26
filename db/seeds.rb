# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

require "open-uri"
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
brands = ["Hippie campers", "BMW Campers", "Volkswagen Campers", "Holiday Campers"]
src_pictures_campers = ["../app/assets/images/campers_seed/camper1.jpeg", "../app/assets/images/campers_seed/camper2.jpeg", "../app/assets/images/campers_seed/camper3.jpeg", "../app/assets/images/campers_seed/camper4.jpeg", "../app/assets/images/campers_seed/camper5.jpeg", "../app/assets/images/campers_seed/camper6.jpeg", "../app/assets/images/campers_seed/camper7.jpeg", "../app/assets/images/campers_seed/camper8.jpeg", "../app/assets/images/campers_seed/camper9.jpeg", "../app/assets/images/campers_seed/camper10.jpeg"]
names_campers = ["The Best Camper", "Modern Camper", "Traditional Camper", "Awesome camper 700", "Falling apart camper", "Barely functional camper", "Dangerous camper", "Your camper for the road", "Best motorhome camper"]
description_campers = ["Super nice camper with lots of space insicde", "Kinda small camper, but still drives amazing", "Might break down on the road, but that's why you can sleep inside!"]
passwords = ["pgh4iqhpg489q", "2r9pjfkae", "3j3231r83p", "fejiagp3hq2g", "feipaqgh3", "139r32f", "3fe2qrf32rr8f"]
img_urls = ["https://i.pinimg.com/564x/54/4e/60/544e60fa76cf6b7eca8f448ae3161c54.jpg", "https://i.pinimg.com/564x/5c/f3/3d/5cf33d7cd11daac1df27220507b97019.jpg", "https://i.pinimg.com/564x/42/fb/97/42fb977dbbc26ce404feb49076287078.jpg", "https://i.pinimg.com/564x/12/db/82/12db82032ca69eb53e01ffc282c111b6.jpg", "https://i.pinimg.com/564x/69/db/48/69db48b9db9ec398749d907bc2498f88.jpg", "https://i.pinimg.com/564x/d1/46/a3/d146a3c48d9d18779edbaf22745eb403.jpg", "https://i.pinimg.com/564x/76/a1/7f/76a17f5e00235712541cbb1894f99fe0.jpg", "https://i.pinimg.com/564x/55/aa/2f/55aa2f6491613569fabbff2a64407cf4.jpg", "https://i.pinimg.com/564x/f8/db/42/f8db42381e0d6628e3903542a8af925a.jpg", "https://i.pinimg.com/564x/64/e5/27/64e527e8b1bc95d24deaeda0c8a39d30.jpg", "https://i.pinimg.com/564x/1b/e8/06/1be8062c687516c6270fc5c874b07ec3.jpg", "https://i.pinimg.com/564x/0e/8b/d2/0e8bd257dcf3cbd91d3353000de8594a.jpg", "https://i.pinimg.com/564x/e4/0d/ef/e40def583d6c2166b455f8b77d217a45.jpg", "https://i.pinimg.com/564x/29/e4/cf/29e4cf8d72f24947ce14b93ee1ece8ee.jpg", "https://i.pinimg.com/564x/c1/2b/34/c12b3483524e8ca7edf0978853951ba0.jpg", "https://i.pinimg.com/564x/b7/13/d0/b713d00533773446438fe3b2a3951509.jpg", "https://i.pinimg.com/564x/ac/51/3f/ac513f61ed91b3a3bd6f43f145916164.jpg", "https://i.pinimg.com/564x/91/53/19/915319efa5470a01a152b0203be8ab51.jpg", "https://i.pinimg.com/564x/ff/75/41/ff75419b95e8f5634c48f6f047b5d1ad.jpg", "https://i.pinimg.com/564x/11/82/db/1182db3f27eed7f8adf65f192a98644c.jpg", "https://i.pinimg.com/736x/bf/c6/a5/bfc6a517b047b107df5bf38fbdfc30c0.jpg"] #add all image URLs
addresses = ["16 Villa Gaudelet, Paris", "5 Avenue Anatole France, Paris", "3 Rue de l'Étoile, Paris", "40 Bd Haussmann, Paris", "130 Rue de Lyon, Paris", "Rue de Rivoli, Paris", "Place du Panthéon, Paris", "181 Rue de Vaugirard, Paris", "17 Rue de Vaugirard, Paris", "Place du Trocadero, Paris", "1 Rue de la Légion d'Honneur, Paris", "77 Rue de Varenne, Paris"]

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
    address: addresses.sample,
    name: names_campers.sample,
    picture_url: src_pictures_campers.sample
  )

  file = URI.open(img_urls.sample)
  offer.photo.attach(io: file, filename: "van.jpg", content_type: "image/jpg")
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
