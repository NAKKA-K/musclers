FactoryBot.define do
  factory :user do
    provider { 'test' }
    uid { Faker::Number.unique.leading_zero_number(digits: 15) }
    nickname { Faker::Name.name }
    description { Faker::Lorem.sentence(word_count: Faker::Number.number(digits: 2)) }
    age { Faker::Number.number(digits: 2) }
    gender { Faker::Number.between(from: 0, to: 3) }
    height { Faker::Number.number(digits: 3) }
    weight { Faker::Number.between(from: 1, to: 120) }
    figure { 5 }
    seriousness { Faker::Number.between(from: 0, to: 2) }
  end
end
