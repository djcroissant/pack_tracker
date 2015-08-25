require 'spec_helper'

describe "creating a user" do
  context "with valid params" do

    before do
      visit "/sign_up"
      fill_in "Email", with: "test@somethingdifferent.com"
      fill_in "Password", with: "Password"
      fill_in "Password confirmation", with: "Password"
      click_button "Submit"
    end

    it "tells the user they have signed up" do
      expect(page).to have_content "You have signed up"
    end

    it "sends them to their expeditions list" do
      expect(current_path).to eq "/"
    end
  end


  context "with invalid params" do

    before do
      visit "/sign_up"
      fill_in "Email", with: "test@somethingdifferent.com"
      fill_in "Password", with: "Password"
      fill_in "Password confirmation", with: "NOPE"
      click_button "Submit"
    end

    it "tells the user they made a mistake" do
      expect(page).to have_content "Password confirmation doesn't match Password"
    end

    before do
      test_user = User.create name:"test", email:"test@thirdexample.com", password_digest:"test"
      visit "sign_up"
      fill_in "Email", with: "test@thirdexample.com"
      fill_in "Password", with: "Password"
      fill_in "Password confirmation", with: "NOPE"
      click_button "Submit"
    end

    it "tells the user the email has already been taken" do
      expect(page).to have_content "Email has already been taken"
    end

    it "tells the user they made a mistake" do
      expect(page).to have_content "Password confirmation doesn't match Password"
    end

  end
end
