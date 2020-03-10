FactoryBot.define do
  factory :comment, aliases: [:commentx] do
    body { Faker::Lorem.sentence(30) }
  end
end