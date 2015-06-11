require 'rails_helper'

RSpec.describe "inventory_items/show", type: :view do
  before(:each) do
    @inventory_item = assign(:inventory_item, InventoryItem.create!(
      :title => "Title",
      :description => "MyText",
      :weight => 1,
      :group_item => false
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Title/)
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(/1/)
    expect(rendered).to match(/false/)
  end
end
