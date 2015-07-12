require 'rails_helper'

RSpec.describe "packed_items/edit", type: :view do
  before(:each) do
    @packed_item = assign(:packed_item, PackedItem.create!(
      :title => "",
      :description => "",
      :weight => "",
    ))
  end

  it "renders the edit packed_item form" do
    render

    assert_select "form[action=?][method=?]", packed_item_path(@packed_item), "post" do

      assert_select "input#packed_item_title[name=?]", "packed_item[title]"

      assert_select "input#packed_item_description[name=?]", "packed_item[description]"

      assert_select "input#packed_item_weight[name=?]", "packed_item[weight]"
    end
  end
end
