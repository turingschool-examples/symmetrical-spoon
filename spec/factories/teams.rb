FactoryBot.define do
  factory :team do
    hometown { Faker::Team.state }
    nickname { Faker::Team.creature }
  end
end
