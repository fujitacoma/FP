FactoryBot.define do
  factory :event do
    event_name { Faker::Name.name }
    content              { Faker::Lorem.sentence }
    prefecture_id        { 2 }
    date                 { '2020-10-01' }
    association :user

    after(:build) do |event|
      event.image.attach(io: File.open('app/assets/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
