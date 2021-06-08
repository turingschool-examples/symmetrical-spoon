FactoryBot.define do
  factory :competition do
    name { Faker::FunnyName.name }
    location { Faker::Team.state }
    sport { Faker::Team.sport }
  end
end
