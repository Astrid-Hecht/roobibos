require 'faker'

FactoryBot.define do
  factory :tea do
    title { Faker::Tea.variety }
    description { Faker::Lorem.sentence }
    temperature { Random.rand(100.0..212.0).round(1) }
    brew_time { Random.rand(30..600) }
  end
end
