FactoryBot.define do
  factory :faq_item do
    question { Faker::Lorem.sentence }
    answer { Faker::Lorem.paragraph }
  end
end
