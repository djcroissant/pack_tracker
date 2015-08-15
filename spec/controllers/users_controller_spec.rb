require 'spec_helper'
require 'rails_helper'

describe UsersController, type: :controller do
  include ActiveJob::TestHelper

  let(:user) { create(:user) }
  let(:attributes) { attributes_for :user }

  describe "GET #new" do
    it "returns http success" do
      get :new
      expect(response).to have_http_status(:success)
    end
  end

  describe "#create" do
    it "changes count" do
      expect { post :create, user: attributes }.to change(User, :count).by(1)
    end

    it "sends welcome email" do
      expect {
        post :create, user: attributes
      }.to change(ActionMailer::Base.deliveries, :count).by(1)
    end
  end
end
