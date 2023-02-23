require 'factory_bot_rails'
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
cust_1 = FactoryBot.create(:customer)
cust_2 = FactoryBot.create(:customer)
cust_3 = FactoryBot.create(:customer)

FactoryBot.create_list(:subscription, 10, customer: cust_1)
FactoryBot.create_list(:subscription, 5, customer: cust_2)

FactoryBot.create_list(:tea, 10)