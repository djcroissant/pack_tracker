require 'rails_helper'

RSpec.describe "inventory_items/edit", type: :view do
  before(:each) do
    @inventory_item = assign(:inventory_item, InventoryItem.create!(
      :title => "MyString",
      :description => "MyText",
      :weight => 1,
    ))
  end

  it "renders the edit inventory_item form" do
    render

    assert_select "form[action=?][method=?]", inventory_item_path(@inventory_item), "post" do

      assert_select "input#inventory_item_title[name=?]", "inventory_item[title]"

      assert_select "textarea#inventory_item_description[name=?]", "inventory_item[description]"

      assert_select "input#inventory_item_weight[name=?]", "inventory_item[weight]"
    end
  end
end
