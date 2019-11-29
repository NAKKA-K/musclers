FactoryBot.define do
  factory :information do
    type { Faker::Number.between(from: 0, to: 3) }
    by_name { Faker::Name.name }
    link { "link" }
  end
end
