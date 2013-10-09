require 'spec_helper'

describe Registration do

  it { should belong_to(:attendee) }
  it { should belong_to(:event) }
  it { should belong_to(:ticket_type) }


  it { should validate_presence_of(:attendee_id) }
  it { should validate_presence_of(:event_id) }
  it { should validate_presence_of(:ticket_type_id) }
  it { should validate_presence_of(:ticket_pdf) }
  it { should_not allow_value(false).for(:paid) }
  it { should_not allow_value("0").for(:terms_of_service) }

  describe "ticket PDF uniqueness" do
    before do
      @ticket1 = FactoryGirl.create(:registration, ticket_pdf: "pdf1.pdf")
      @ticket2 = FactoryGirl.build(:registration, ticket_pdf: "pdf1.pdf")
      @ticket2.valid?
    end

    subject { @ticket2.errors.full_messages }
    it { should include "Ticket pdf has already been taken" }
  end

  describe "destroying an event destroys its registrations" do
    before do
      @registration = FactoryGirl.create(:registration)
      Event.first.destroy
    end
    subject { Registration.count }
    it { should eq 0 }
  end

  describe "destroying a ticket type destroys its registrations" do
    before do
      @registration = FactoryGirl.create(:registration)
      @registration.ticket_type.destroy
    end
    subject { Registration.count }
    it { should eq 0 }
  end

  describe "destroying an attendee destroys its registrations" do
    before do
      @registration = FactoryGirl.create(:registration)
      @registration.attendee.destroy
    end
    subject { Registration.count }
    it { should eq 0 }
  end

  describe "terms of service" do

    describe "were not accepted" do
      let(:no_acceptance) { FactoryGirl.build(:registration, terms_of_service: "0") }
      subject { no_acceptance }
      it { should_not be_valid }
    end

    describe "were accepted" do
      let(:acceptance) { FactoryGirl.build(:registration) }
      before { acceptance.terms_of_service = "1" }
      subject { acceptance }
      it { should be_valid }
    end

  end

end
