# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :registration do
    attendee
    ticket_type
    event { ticket_type.event }
    paid true
    ticket_pdf { "#{Faker::Lorem.word}.pdf" }
    terms_of_service "1"
  end
end
