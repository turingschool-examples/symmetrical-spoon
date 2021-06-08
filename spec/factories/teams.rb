FactoryBot.define do
  factory :team do
    hometown { Faker::Address.city }
    nickname { Faker::FunnyName.two_word_name }
  end
end
