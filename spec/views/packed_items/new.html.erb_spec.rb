require 'rails_helper'

RSpec.describe "packed_items/new", type: :view do
  before(:each) do
    assign(:packed_item, PackedItem.new(
      :title => "",
      :description => "",
      :weight => "",
      :group_item => false
    ))
  end

  it "renders new packed_item form" do
    render

    assert_select "form[action=?][method=?]", packed_items_path, "post" do

      assert_select "input#packed_item_title[name=?]", "packed_item[title]"

      assert_select "input#packed_item_description[name=?]", "packed_item[description]"

      assert_select "input#packed_item_weight[name=?]", "packed_item[weight]"

      assert_select "input#packed_item_group_item[name=?]", "packed_item[group_item]"
    end
  end
end
