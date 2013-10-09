require 'spec_helper'

describe TicketType do

  it { should have_many(:registrations) }
  it { should belong_to(:event) }

  it { should validate_presence_of(:name) }
  it { should validate_presence_of(:sales_end) }
  it { should validate_presence_of(:price) }
  it { should validate_presence_of(:fee) }
  it { should validate_presence_of(:description) }
  it { should validate_presence_of(:event_id) }
  it { should validate_presence_of(:total_quantity) }
  it { should validate_presence_of(:max_per_attendee) }
  [1.555, 1.5555555555555].each do |value|
    it { should_not allow_value(value).for(:price)}
  end
  [0.01, 1.01, 1.1].each do |value|
    it { should allow_value(value).for(:price) }
  end
  [1.555, 1.5555555555555].each do |value|
    it { should_not allow_value(value).for(:fee)}
  end
  [0.01, 1.01, 1.1].each do |value|
    it { should allow_value(value).for(:fee) }
  end
  it { should validate_numericality_of(:price) }
  it { should validate_numericality_of(:fee) }
  it { should validate_numericality_of(:max_per_attendee) }
  it { should validate_numericality_of(:total_quantity) }
  it { should ensure_length_of(:name).is_at_least(5).is_at_most(50) }
  it { should ensure_length_of(:description).is_at_least(100).is_at_most(2000) }
  it { should validate_numericality_of(:max_per_attendee).is_greater_than(0).only_integer }
  it { should validate_numericality_of(:total_quantity).is_greater_than(0).only_integer }


  describe "destroying an event destroys its ticket types" do
    before do
      @tickettype = FactoryGirl.create(:ticket_type)
      Event.first.destroy
    end
    subject { TicketType.count }
    it { should eq 0 }
  end

end
