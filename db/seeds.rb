# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)


# Clear existing users
User.destroy_all

User.create(email: 'admin@gmail.com', password: 'password', password_confirmation: 'password')

# Clear existing brands
Brand.destroy_all

# Array of sample social media platforms
social_media_platforms = ['Facebook', 'Instagram', 'Twitter']

# Seed 10 random brands
10.times do
  brand = Brand.create(
    name: Faker::Company.name,
    logo: Faker::LoremFlickr.image(size: "50x50"),
    website_url: Faker::Internet.url,
    founded_year: rand(1900..2023),
    primary_contact: Faker::Name.name,
    social_media_links: Array.new(3) { { platform: social_media_platforms.sample, link: Faker::Internet.url } }
  )
  puts "Created brand: #{brand.name}"
end