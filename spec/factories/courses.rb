FactoryBot.define do
  factory :course do
    name { Faker::Educator.course_name }
    description { Faker::Lorem.paragraph }
    after(:build) do |course|
      course.image.attach(io: File.open(Rails.root.join('spec', 'factories', 'images', 'course.png')),
                          filename: 'course.png', content_type: 'image/png')
    end
  end
end
