# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

require 'faker'

puts "Cleaning database..."

def generate_unique_shop_name
  shop_name = Faker::Company.name
  while Shop.exists?(name: shop_name)
    shop_name = Faker::Company.name
  end
  shop_name
end

10.times  do
  Shop.create!(
    name: generate_unique_shop_name,
    address: Faker::Address.street_address,
    city: Faker::Address.city
  )
end
puts "Finished!"
