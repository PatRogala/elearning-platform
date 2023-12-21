# frozen_string_literal: true

FactoryBot.define do
  factory :user do
    email { Faker::Internet.email }
    password { "password" }
    fullname { Faker::Name.name }
    admin { false }
    avatar { nil }

    trait :admin do
      admin { true }
    end

    trait :with_avatar do
      after(:build) do |user|
        user.avatar.attach(io: Rails.root.join("spec/fixtures/files/avatar.png").open, filename: "avatar.png",
                           content_type: "image/png")
      end
    end
  end
end
