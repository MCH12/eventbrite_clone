require 'spec_helper'

describe Event do

  it { should belong_to(:organizer) }
  it { should have_many(:registrations) }
  it { should have_many(:attendees).through(:registrations) }

  it { should ensure_length_of(:name).is_at_least(5).is_at_most(50) }
  it { should validate_presence_of(:name) }
  it { should validate_presence_of(:venue) }
  it { should validate_presence_of(:address) }
  it { should validate_presence_of(:city) }
  it { should validate_presence_of(:state) }
  it { should validate_presence_of(:zip_code) }
  it { should validate_presence_of(:organizer_id) }
  it { should validate_presence_of(:start_datetime) }
  it { should validate_presence_of(:end_datetime) }
  it { should_not allow_value("0").for(:terms_of_service) }
  %w(1234 1234a 123456).each do |value|
    it { should_not allow_value(value).for(:zip_code) }
  end
  %w(10 AAA ZB X).each do |value|
    it { should_not allow_value(value).for(:state) }
  end
  it { should ensure_length_of(:address).is_at_least(5).is_at_most(50) }
  it { should ensure_length_of(:city).is_at_least(5).is_at_most(50) }

  describe "terms of service" do

    let(:no_acceptance) { FactoryGirl.build(:event, terms_of_service: "0") }
    subject { no_acceptance }
    it { should_not be_valid }

  end

  describe "destroying an organizer destroys its events" do
    before do
      @event = FactoryGirl.create(:event)
      @event.organizer.destroy
    end
    subject { Event.count }
    it { should eq 0 }
  end

  describe "validations" do

    describe "for an invalid event" do
      let(:event) { Event.new }
      subject { event }
      it { should_not be_valid }

      context "error messages" do

        before { event.valid? }
        subject { event.errors.full_messages }

        # it { should include("Terms of service must be accepted") }
        it { should include("Zip code must be exactly 5 digits") }

      end
    end

    describe "for a valid event" do
      let(:event) { FactoryGirl.build(:event) }
      subject { event }
      it "should be valid" do
        event.terms_of_service = "1"
        expect(event).to be_valid
      end
    end
  end

end
