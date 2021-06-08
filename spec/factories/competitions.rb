FactoryBot.define do
  factory :competition do
    name { Faker::FunnyName.two_word_name }
    location { Faker::Address.city }
    sport { 'Basket Ball' }
  end
end
