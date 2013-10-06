require 'spec_helper'

describe Registration do

  it { should validate_presence_of(:attendee_id) }
  it { should validate_presence_of(:event_id) }
  it { should validate_presence_of(:ticket_type_id) }
  it { should validate_presence_of(:ticket_pdf) }
  it { should_not allow_value(false).for(:paid) }

  describe "ticket PDF uniqueness" do
    before do
      @ticket1 = FactoryGirl.create(:registration)
      @ticket2 = FactoryGirl.build(:registration)
      @ticket2.valid?
    end

    subject { @ticket2.errors.full_messages }
    it { should include "Ticket pdf has already been taken" }
  end

  describe "terms of service" do

    describe "were not accepted" do
      let(:no_acceptance) { FactoryGirl.create(:registration) }
      subject { no_acceptance }
      it { should_not be_valid }
    end

    describe "were accepted" do
      let(:acceptance) { FactoryGirl.create(:registration) }
      before { acceptance.terms_of_service = "1" }
      subject { acceptance }
      it { should be_valid }
    end

  end

end
