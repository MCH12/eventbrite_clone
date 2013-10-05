require 'spec_helper'

describe Event do


  describe "validations" do

    describe "for an invalid event" do
      let(:event) { Event.new }
      subject { event }
      it { should_not be_valid }

      context "error messages" do

        before { event.valid? }
        subject { event.errors.full_messages }

        it { should include("Name can't be blank") }
        it { should include("Venue can't be blank") }
        it { should include("Private status can't be blank") }
        it { should include("Address can't be blank") }
        it { should include("City can't be blank") }
        it { should include("State can't be blank") }
        it { should include("Zip code can't be blank") }
        it { should include("Start datetime can't be blank") }
        it { should include("End datetime can't be blank") }
        # it { should include("Terms of service must be accepted") }
        it { should include("Zip code must be exactly 5 digits") }
      end
    end

    describe "for a valid event" do
      let(:event) { FactoryGirl.create(:event) }
      subject { event }

      it { should be_valid }
    end
  end


end

# :address, :city, :end_datetime, :name, :organizer_id, :start_datetime, :state, :zip, presence: true
