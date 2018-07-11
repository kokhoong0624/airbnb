# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# Seed Users
require 'faker'
user = {}
user['password'] = 'asdf'

ActiveRecord::Base.transaction do
  20.times do 
    user['email'] = Faker::Internet.email
    User.create(user)
  end
end 

# Seed Listings
listing = {}
uids = []
User.all.each { |u| uids << u.id }

ActiveRecord::Base.transaction do
  40.times do 
    listing['title'] = Faker::App.name
    listing['home_type'] = ["House", "Apartment", "Other"].sample

    listing['room_number'] = rand(1..8)
    listing['room_type'] = ["Entire Lot", "Single Room", "Shared Room", "Other"].sample
    listing['accomodate'] = rand(1..8)

    listing['city'] = Faker::Address.city
    listing['address'] = Faker::Address.full_address

    listing['pricing'] = rand(80..500)
    listing['currency'] = Faker::Currency.code
    listing['description'] = Faker::Hipster.sentence
    listing['amenities'] = ["Self check-in","Pool","Gym","Washer","Dryer","Heating","Air Conditioning","Wifi","Parking","Pets Allowed"].sample(rand(1..9))

    listing['user_id'] = uids.sample

    Listing.create(listing)
  end
end
