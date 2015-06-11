require 'rails_helper'

RSpec.describe "PackedItems", type: :request do
  describe "GET /packed_items" do
    it "works! (now write some real specs)" do
      get packed_items_path
      expect(response).to have_http_status(200)
    end
  end
end
