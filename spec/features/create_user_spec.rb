# require 'spec_helper'

# describe "creating a user" do
#   context "with valid params" do

#     before do
#       visit "/users/new"
#       fill_in "Email", with: "test@test.com"
#       fill_in "Password", with: "Password"
#       fill_in "Password confirmation", with: "Password"
#       click_button "Submit"
#     end

#     it "tells the user they have signed up" do
#       expect(page).to have_content "You have signed up"
#     end

#     it "sends them to the dashboard" do
#       expect(current_path).to eq "/dashboard"
#     end
#   end

#   context "with invalid params" do

#     before do
#       visit "/users/new"
#       fill_in "Email", with: "test@test.com"
#       fill_in "Password", with: "Password"
#       fill_in "Password confirmation", with: "NOPE"
#       click_button "Submit"
#     end

#     it "tells the user they made a mistake" do
#       expect(page).to have_content "Password confirmation doesn't match Password"
#     end

#     before do
#       test_user = User.create name:"test", email:"test@test.com", password_digest:"test"
#       visit "/users/new"
#       fill_in "Email", with: "test@test.com"
#       fill_in "Password", with: "Password"
#       fill_in "Password confirmation", with: "NOPE"
#       click_button "Submit"
#     end

#     it "tells the user they made a mistake" do
#       expect(page).to have_content "Email has already been taken"
#     end

#   end
# end
