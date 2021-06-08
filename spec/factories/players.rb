FactoryBot.define do
  factory :player do
    name { Faker::Name.name }
    age { rand(10..27) }
  end
end
