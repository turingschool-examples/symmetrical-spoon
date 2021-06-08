FactoryBot.define do
  factory :player do
    name { Faker::Name.name }
    age { rand(18..38) }
  end
end
