require 'rails_helper'

RSpec.describe "packed_items/index", type: :view do
  before(:each) do
    assign(:packed_items, [
      PackedItem.create!(
        :title => "",
        :description => "",
        :weight => "",
        :group_item => false
      ),
      PackedItem.create!(
        :title => "",
        :description => "",
        :weight => "",
        :group_item => false
      )
    ])
  end

  it "renders a list of packed_items" do
    render
    assert_select "tr>td", :text => "".to_s, :count => 2
    assert_select "tr>td", :text => "".to_s, :count => 2
    assert_select "tr>td", :text => "".to_s, :count => 2
    assert_select "tr>td", :text => false.to_s, :count => 2
  end
end
