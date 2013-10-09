require 'spec_helper'

describe Message do

  it { should belong_to(:organizer) }

  it { should validate_presence_of(:content) }
  it { should validate_presence_of(:organizer_id) }
  it { should validate_presence_of(:sender_email) }
  %w(.com a.com a.museums a@dbc.museums @dbc.museums a@museums).each do |value|
    it { should_not allow_value(value).for(:sender_email) }
  end
  it { should ensure_length_of(:content).is_at_most(10000) }

end
