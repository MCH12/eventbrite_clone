# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :ticket_type do
    name "MyString"
    sales_end "2013-10-05 13:33:47"
    price 1.5
    fee 1.5
    description "MyText"
    sold_out false
    event_id 1
    total_quantity 1
    max_per_attendee 1
  end
end
