# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# insert data in campaigns table.
10.times do
  impression = Faker::Number.number(digits: 4) # return digits upto 4 digits
  click = Faker::Number.number(digits: 3) # return digits upto 3 digits
  cv = Faker::Number.number(digits: 4) # return random paragraph
  cost = Faker::Number.decimal(l_digits: 2, r_digits: 2) # # return a 2 digit number with 2 decimal digits.
  Campaign.create(impression: impression, click: click, cv: cv, cost: cost)
end
