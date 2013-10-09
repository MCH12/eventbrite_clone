require 'spec_helper'

describe 'Signup' do

  describe "page" do

    before { visit signup_path }

    it "exists" do
      expect(current_path).to eq "/users/new"
    end

    it "has the right title" do
      expect(page).to have_content "Sign Up"
    end

    it "has a signup form" do
      expect(page).to have_selector("form#new_user")
    end

    it "successfully signs up a user" do
      fill_in :user_username, with: "misterrogers"
      fill_in :user_first_name, with: "Fred"
      fill_in :user_last_name, with: "Rogers"
      fill_in :user_password, with: "password"
      fill_in :user_password_confirmation, with: "password"
      fill_in :user_email, with: "fred@mrrogers.com"
      fill_in :user_website, with: "misterrogers.com"
      find(:css, "#user_terms_of_service").set(true)
      click_button "Sign Up!"
      expect(User.count).to eq 1
    end

    it "successfully shows the right errors when new user provides invalid data" do
      click_button "Sign Up!"
      expect(User.count).to eq 0
      expect(page).to have_content("7 errors prevented you from signing up:")
    end

  end

end
