FactoryBot.define do
  factory :course do
    name { Faker::Educator.course_name }
    description { Faker::Lorem.paragraph }

    trait :invalid do
      name { nil }
    end

    trait :with_image do
      after(:build) do |course|
        course.image.attach(io: File.open(Rails.root.join("spec/factories/images/course.png")), filename: "course.png", content_type: "image/png")
      end
    end
  end
end
