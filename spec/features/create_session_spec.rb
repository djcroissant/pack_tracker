require 'spec_helper'

describe "creating a session" do
  context "before signing in" do
    it "has certain links" do
      visit "/"
      expect(page).to have_link "Sign Up"
      expect(page).not_to have_link "Sign In"
    end

  end
  context "before signing up" do
    it "has certain links" do
      visit "/sign_up"
      expect(page).to have_link "Login"
      expect(page).not_to have_link "Sign Up"
    end

    it "sends the user to the sign_up page" do
      visit "/"
      click_link "Sign Up"
      expect(current_path).to eq "/sign_up"
    end
  end

  context "after signing in" do
    let(:user) { create(:user) }

    before do
      login_as user
    end

    it "has certain links" do
      expect(page).to have_link "Expeditions"
      expect(page).to have_link "Inventory"
    end

    it "tells the new user they don't have any expeditions yet" do
      expect(page).to have_content "You're not signed up for any expeditions yet"
    end
  end
end
