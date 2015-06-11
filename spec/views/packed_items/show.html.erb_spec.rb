require 'rails_helper'

RSpec.describe "packed_items/show", type: :view do
  before(:each) do
    @packed_item = assign(:packed_item, PackedItem.create!(
      :title => "",
      :description => "",
      :weight => "",
      :group_item => false
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(//)
    expect(rendered).to match(//)
    expect(rendered).to match(//)
    expect(rendered).to match(/false/)
  end
end
