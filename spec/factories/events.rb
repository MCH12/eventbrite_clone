# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :event do
    name "MyString"
    address "MyString"
    city "MyString"
    state "NY"
    zip_code 12345
    start_datetime "2013-10-05 13:36:27"
    end_datetime "2013-10-05 13:36:27"
    logo "MyString"
    organizer_id 1
    venue "MyString"
    private_status false
  end
end
