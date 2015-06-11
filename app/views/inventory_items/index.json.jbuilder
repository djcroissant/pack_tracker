json.array!(@inventory_items) do |inventory_item|
  json.extract! inventory_item, :id, :title, :description, :weight, :group_item
  json.url inventory_item_url(inventory_item, format: :json)
end
