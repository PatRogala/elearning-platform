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
      avatar { Rack::Test::UploadedFile.new(Rails.root.join("spec/factories/images/avatar.png"), "image/png") }
    end
  end
end
