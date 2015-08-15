require 'spec_helper'
require 'rails_helper'

describe Expedition, type: :model do
  let(:user) { create(:user) }
  let(:expedition) { create(:expedition) }

  context "#add_user" do
    it "adds an association between the expedition and the user" do
      expect { expedition.add_user(user) }.to change(expedition.users, :count).by(1)
    end
  end
end
