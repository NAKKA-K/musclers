FactoryBot.define do
  factory :group do
    name { Faker::Name.name }
    description { Faker::Lorem.sentence(word_count: Faker::Number.number(digits: 2)) }
    is_public { true }
    tags { Faker::Name.name }
  end
end
