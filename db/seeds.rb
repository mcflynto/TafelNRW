# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'faker'

2.times do |n|
  name  = "Tafel#{n + 1}"
  email = "tafel-#{n + 1}@byom.de"
  city = Faker::Address.city
  street = Faker::Address.street_name
  plz = Faker::Address.zip
  house_number = Faker::Address.building_number
  phone = Faker::PhoneNumber.phone_number

  Organization.create!(name:  name,
                       email: email)

  Address.create!(city: city,
                  street: street,
                  plz: plz,
                  house_number: house_number,
                  phone: phone,
                  addressable_id: n + 1,
                  addressable_type: 'Organization')
end

User.create!(first_name: 'Julian',
             last_name: 'Treutler',
             email: 'julian@byom.de',
             password: 'testtest',
             admin: true,
             organization_id: 1)

User.create!(first_name: 'Philipp',
             last_name: 'Doll',
             email: 'philipp@byom.de',
             password: 'testtest',
             admin: true,
             organization_id: 2)

10.times do |n|
  name  = "Spender#{n + 1}"
  email = "Spender-#{n + 1}@byom.de"
  city = Faker::Address.city
  street = Faker::Address.street_name
  plz = Faker::Address.zip
  house_number = Faker::Address.building_number
  phone = Faker::PhoneNumber.phone_number
  food = Faker::Beer.name
  amount = Faker::Number.number(3)

  Donator.create!(name:  name,
                  email: email)

  Address.create!(city: city,
                  street: street,
                  plz: plz,
                  house_number: house_number,
                  phone: phone,
                  addressable_id: n + 1,
                  addressable_type: 'Donator')

  Donation.create!(food: food,
                   amount: amount,
                   unit: 'liter',
                   expiry_date: Time.zone.now + 1.year,
                   donator_id: n + 1)
end
