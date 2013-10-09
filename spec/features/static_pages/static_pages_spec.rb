require 'spec_helper'

describe 'Static pages' do

  describe "help page" do

    before { visit root_path }
    it "should navigate to the help page" do
      click_link "Help"
      expect(current_path).to eq help_path
      expect(page).to have_title "EventBrite Clone | Help"
    end

    it "should navigate to the careers page" do
      click_link "Careers"
      expect(current_path).to eq careers_path
      expect(page).to have_title "EventBrite Clone | Careers"
    end

    it "should navigate to the terms of service page" do
      click_link "Terms Of Service"
      expect(current_path).to eq terms_of_service_path
      expect(page).to have_title "EventBrite Clone | Terms Of Service"
    end

    it "should navigate to the about page" do
      click_link "About"
      expect(current_path).to eq about_path
      expect(page).to have_title "EventBrite Clone | About Us"
    end

  end

end
