require 'spec_helper'

describe 'The User#show page' do

  let(:user) { FactoryGirl.create(:user) }
  before { visit user_path(user) }

  it "displays all the right information" do
    expect(page).to have_content(user.username)
    expect(page).to have_title(user.username)
  end

end
