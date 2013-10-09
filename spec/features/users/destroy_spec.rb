require 'spec_helper'

# include LoginHelper

describe 'Deleting an account' do

  let(:user) { FactoryGirl.create(:user) }
  let(:user2) { FactoryGirl.create(:user) }
  subject { page }

  it "shows the 'Delete My Account' link only for the correct user" do
    visit login_path
    fill_in :session_username, with: user.username
    fill_in :session_username, with: user.password
    click_button "Log In"
    visit user_path(user)
    expect(page).to have_link("Delete My Account")
  end

  it "does not show the 'Delete My Account' link for another user's page" do
    visit login_path
    fill_in :session_username, with: user.username
    fill_in :session_password, with: user.password
    click_button "Log In"
    visit user_path(user2)
    expect(page).not_to have_link("Delete My Account")
  end

end
