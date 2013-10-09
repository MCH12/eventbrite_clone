# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :ticket_type do
    name "MyText"
    description "Lorem ipsum dolor sit amet lorem ipsum dolor sit amet lorem ipsum dolor sit amet lorem ipsum dolor sit amet lorem ipsum dolor sit amet lorem"
    sales_end "2013-10-05 13:33:47"
    price 1.50
    fee 1.50
    sold_out false
    event
    total_quantity 1
    max_per_attendee 1
  end
end
