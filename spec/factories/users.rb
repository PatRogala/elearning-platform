# frozen_string_literal: true

FactoryBot.define do
  factory :user do
    email { Faker::Internet.email }
    password { "password" }
    fullname { Faker::Name.name }
    admin { false }

    trait :admin do
      admin { true }
    end
  end
end
