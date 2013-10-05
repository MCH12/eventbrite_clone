# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :registration do
    attendee_id 1
    event_id 1
    ticket_type_id 1
    paid false
    ticket_pdf "MyString"
  end
end
