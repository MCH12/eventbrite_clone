# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
    factory :user, aliases: [:organizer, :attendee] do
    first_name { Faker::Name.first_name }
    last_name { Faker::Name.last_name }
    username { Faker::Lorem.words(2).join('') }
    password "password"
    password_confirmation "password"
    email { Faker::Internet.email }
    facebook_id { Faker::Lorem.words(3).join('') }
    twitter_id { Faker::Lorem.words(3).join('') }
    description "MyText"
    website "MyString.com"
    terms_of_service "1"
  end
end


