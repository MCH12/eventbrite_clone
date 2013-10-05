# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :event do
    name "MyString"
    address "MyString"
    city "MyString"
    state "MyString"
    zip 1
    start_datetime "2013-10-05 13:36:27"
    end_datetime "2013-10-05 13:36:27"
    logo "MyString"
    organizer_id 1
  end
end
