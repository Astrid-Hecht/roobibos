require 'faker'

FactoryBot.define do
  factory :subscription do
    title { Faker::Tea.type }
    price { Random.rand(5.00..100.00).round(2) }
    status { Random.rand(0..1) }
    frequency { Random.rand(52) }
  end
end
