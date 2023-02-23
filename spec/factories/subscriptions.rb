require 'faker'

FactoryBot.define do
  factory :subscription do
    title { Faker::Tea.type }
    price { Random.rand(5.00..100.00) }
    status { Random.rand(1) }
    frequency { Random.rand(52) }
  end
end
