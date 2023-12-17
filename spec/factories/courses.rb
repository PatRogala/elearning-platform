FactoryBot.define do
  factory :course do
    name { Faker::Educator.course_name }
    description { Faker::Lorem.paragraph }
    image { Rack::Test::UploadedFile.new(Rails.root.join("spec/factories/images/course.png"), "image/png") }

    trait :invalid do
      name { nil }
    end
  end
end
