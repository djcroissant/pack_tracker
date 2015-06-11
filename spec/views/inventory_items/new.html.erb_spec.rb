require 'rails_helper'

RSpec.describe "inventory_items/new", type: :view do
  before(:each) do
    assign(:inventory_item, InventoryItem.new(
      :title => "MyString",
      :description => "MyText",
      :weight => 1,
      :group_item => false
    ))
  end

  it "renders new inventory_item form" do
    render

    assert_select "form[action=?][method=?]", inventory_items_path, "post" do

      assert_select "input#inventory_item_title[name=?]", "inventory_item[title]"

      assert_select "textarea#inventory_item_description[name=?]", "inventory_item[description]"

      assert_select "input#inventory_item_weight[name=?]", "inventory_item[weight]"

      assert_select "input#inventory_item_group_item[name=?]", "inventory_item[group_item]"
    end
  end
end
