require 'spec_helper'
require 'rails_helper'

describe PackerController do

  let(:user) { create(:user_with_items) }
  let(:inventory_item) { create(:inventory_item) }

  describe "#allocate" do
    context "when not signed in" do
      it "redirects to sign in page" do
        get :allocate
        expect(response).to redirect_to(login_url)
      end
    end

    context "when signed in" do
      before do
        sign_in user
        get :allocate
      end

      it "is successful" do
        expect(response).to be_success
      end

      it "assigns inventory_items with items for signed in user" do
        expect(assigns(:inventory_items)).to eq user.inventory_items
        # expect(user.inventory_items.count).to eq 5
      end
    end
  end

end
