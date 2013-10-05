# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :message do
    organizer_id 1
    sender_email "MyString"
    content "MyText"
  end
end
