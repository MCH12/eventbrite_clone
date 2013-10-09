require 'spec_helper'

describe User do
  # it { should include("Email doesn't match confirmation") }

  it { should have_many(:registrations) }
  it { should have_many(:attended_events).through(:registrations) }
  it { should have_many(:organized_events) }
  it { should have_many(:messages) }

  it { should validate_presence_of(:username) }
  it { should validate_presence_of(:password_digest) }
  it { should validate_presence_of(:email) }
  # it { should include("Email doesn't have a valid format") }
  %w(.com a.com a.museums a@dbc.museums @dbc.museums a@museums).each do |value|
    it { should_not allow_value(value).for(:email) }
  end
  it { should ensure_length_of(:username).is_at_least(3).is_at_most(30) }
  it { should validate_uniqueness_of(:username) }
  it { should validate_uniqueness_of(:email) }
  it { should validate_uniqueness_of(:twitter_id) }
  it { should validate_uniqueness_of(:facebook_id) }
  %w(apple .com apple.comcomcom).each do |value|
    it { should_not allow_value(value).for(:website) }
  end
  it { should_not allow_value("0").for(:terms_of_service) }

end
