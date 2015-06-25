class PackerController < ApplicationController
  def allocate
    @inventory_items=InventoryItem.all
    @climbers=Climber.all
  end

  def pack_it
    @params = params.select {|inventory_item_id,climber_name| inventory_item_id =~ /^\d+/}
    @params.reject! {|inventory_item_id,climber_name| climber_name == "Not Packed"}
    @params.each do |inventory_item_id,climber_name|
      ii = InventoryItem.find(inventory_item_id)
      PackedItem.create(
        climber_id: (Climber.find_by name: climber_name).id,
        title: ii.title,
        description: ii.description,
        weight: ii.weight,
        group_item: ii.group_item
        )
      end
    #redirect_to packer_allocate_path , alert: "#{params}"
  end

end
