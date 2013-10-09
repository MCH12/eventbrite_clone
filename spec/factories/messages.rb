# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :message do
    organizer
    sender_email { Faker::Internet.email }
    content "MyText"
  end
end
