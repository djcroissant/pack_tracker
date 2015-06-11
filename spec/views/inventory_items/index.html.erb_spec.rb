require 'rails_helper'

RSpec.describe "inventory_items/index", type: :view do
  before(:each) do
    assign(:inventory_items, [
      InventoryItem.create!(
        :title => "Title",
        :description => "MyText",
        :weight => 1,
        :group_item => false
      ),
      InventoryItem.create!(
        :title => "Title",
        :description => "MyText",
        :weight => 1,
        :group_item => false
      )
    ])
  end

  it "renders a list of inventory_items" do
    render
    assert_select "tr>td", :text => "Title".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => false.to_s, :count => 2
  end
end
