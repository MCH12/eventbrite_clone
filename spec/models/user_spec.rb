require 'spec_helper'

describe User do


  it { should have_many(:registrations) }
  it { should have_many(:attended_events).through(:registrations) }
  it { should have_many(:organized_events) }
  it { should have_many(:messages) }

  it { should respond_to(:authenticate) }
  it { should respond_to(:password_digest)}
  it { should respond_to(:password) }
  it { should respond_to(:password_confirmation) }
  it { should validate_presence_of(:username) }
  it { should validate_presence_of(:password) }
  it { should validate_presence_of(:email) }
  %w(.com a.com a.museums a@dbc.museums @dbc.museums a@museums).each do |value|
    it { should_not allow_value(value).for(:email) }
  end
  it { should ensure_length_of(:username).is_at_least(3).is_at_most(30) }
  it { should validate_uniqueness_of(:email) }

  describe "uniqueness validations" do
    # for some reason the standard shoulda matchers syntax wouldn't work for these 3 validations;
    # I kept getting the error message "no method 'downcase' for Nil:NilClass"; it's related somehow
    # to the 'before_save' callback in the User model, but I can't figure out how
    let(:user) { FactoryGirl.create(:user) }
    let(:user2) { FactoryGirl.build(:user, username: user.username, twitter_id: user.twitter_id, facebook_id: user.facebook_id)}
    subject { user }
    it "should validate uniqueness of facebook_id, twitter_id and username" do
      user2.valid?
      expect(user2.errors.full_messages).to include("Twitter id has already been taken")
      expect(user2.errors.full_messages).to include("Facebook id has already been taken")
      expect(user2.errors.full_messages).to include("Username has already been taken")
    end
  end
  %w(apple .com apple.comcomcom).each do |value|
    it { should_not allow_value(value).for(:website) }
  end
  it { should_not allow_value("0").for(:terms_of_service) }

end
