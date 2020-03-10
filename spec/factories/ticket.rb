FactoryBot.define do
  factory :ticket do
    title { Faker::Lorem.sentence(3) }
    description { Faker::Lorem.sentence(30) }
  end
end
