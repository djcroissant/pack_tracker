require 'spec_helper'
require 'rails_helper'

describe PackerController do

  let(:user) { create(:user_with_items) }
  let(:inventory_item) { create(:inventory_item) }
  # let(:expedition) { create(:expedition) }

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

  describe "#packing_list" do
    context "when not signed in" do
      it "redirects to sign in page" do
        get :packing_list
        expect(response).to redirect_to(login_url)
      end
    end

    context "when signed in" do
      before do
        sign_in user
        get :packing_list, expedition_id: user.expeditions.first.id
      end

      it "is successful" do
        expect(response).to be_success
        # expect(assigns(:expedition).inventory_items.count).to eq 5
      end

      it "assigns items with items for signed in user that are allocated to that expedition" do
        #note that user.expeditions.first.inventory_items gives all inventory
        #items for that expedition, not just those for the user.  But that's
        #actually what we want here.
        #But shoule make multiple users to be a better test
        expect(assigns(:items)).to eq user.expeditions.first.inventory_items
      end
    end
  end

describe "#pack_it" do
  context "when not signed in" do
    it "redirects to sign in page" do
      get :pack_it
      expect(response).to redirect_to(login_url)
    end
  end

  context "when signed in" do
    before do
      sign_in user
    end

    it "modifies inventory items in user's expedition based on user's selection" do
      packed_items = user.expeditions.first.inventory_items.map do |i|
        #makes it random whether a piece of inventory is "selected"
        if rand(2) == 0
          {i.id.to_s => "value" }
        end
      end
      packed_items.compact!

      if packed_items.empty?
        packed_params = Hash.new
        packed_ids = Array.new
      else
        packed_params = packed_items.reduce Hash.new, :merge
        packed_ids = packed_params.keys.map { |k| k.to_i }
      end

      packed_params[:expedition_id] = user.expeditions.first.id
      get :pack_it, packed_params


      expect(assigns(:user).expeditions.first.inventory_items.where(user_id: user.id).map { |i| i.id }).to eq packed_ids
    end
  end
end

end
