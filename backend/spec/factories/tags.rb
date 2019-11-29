FactoryBot.define do
  sequence :tag_name do |i|
    tags = ["chubby", "normal", "thin", "macho", "lean", "slim", "health", "hobby", "job", "short_term", "long_term"]
    tags[i-1]
  end

  factory :tag do
    name { generate :tag_name }
  end
end
