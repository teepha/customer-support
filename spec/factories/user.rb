FactoryBot.define do
  factory :user, aliases: [:userx] do
    name { Faker::Name.first_name}
    email { Faker::Internet.email }
    password { "password" }

    factory :agent do
      is_agent { true }
    end

    factory :admin do
      is_admin { true }
    end
  end
end
