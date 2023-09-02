# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)


# Clear existing data
User.destroy_all
Brand.destroy_all
Product.destroy_all

User.create(email: 'admin@gmail.com', password: 'password', password_confirmation: 'password')

# Array of sample social media platforms
social_media_platforms = ['Facebook', 'Instagram', 'Twitter']

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

10.times do
  product = Product.create(
    name: Faker::Commerce.product_name,
    description: Faker::Lorem.paragraph,
    material: Faker::Commerce.material,
    size_options: Faker::Lorem.words(number: 3).join(', '),
    color_options: Faker::Commerce.color,
    care_instructions: Faker::Lorem.sentence,
    price_cents: rand(1000..10000),
    price_currency: 'USD',
    brand: Brand.all.sample
  )

  puts "Created product: #{product.name}"
end
