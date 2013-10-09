require 'spec_helper'

describe 'Login page' do

  let(:user) { FactoryGirl.create(:user) }
  subject { page }
  before { visit login_path }

  it { should have_title("EventBrite Clone | Log In") }
  it { should have_content("Log In") }

  describe "when logging in" do

    it "successfully logs in an authenticated user" do
      fill_in :user_username, with: user.username
      fill_in :user_password_digest, with: user.password_digest
      click_button "Log In"
      expect(current_path).to eq user_path(user)
    end

    it "successfully prevents an unauthorized user from signing in" do
      fill_in :user_username, with: user.username
      fill_in :user_password_digest, with: "nottherightpassword"
      click_button "Log In"
      expect(page).to have_content("Your username and/or password are incorrect.  Please try again.")
    end

  end

end
