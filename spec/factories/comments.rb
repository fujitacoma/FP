FactoryBot.define do
  factory :comment do
    content { 'MyText' }
    user_id { 1 }
    event_id { 1 }
  end
end
