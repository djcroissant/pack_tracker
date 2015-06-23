class PackerController < ApplicationController
  def allocate
    @inventory_items=InventoryItem.all
    @climbers=Climber.all
  end

  def pack_it
    @params = params.select {|k,v| k =~ /^\d+/}
    @params.each do |k,v|
      ii = InventoryItem.find(k.to_i)
      PackedItem.create(
        climber_id: (Climber.find_by name: v).id,
        title: ii.title,
        description: ii.description,
        weight: ii.weight,
        group_item: ii.group_item)
      end
    #redirect_to packer_allocate_path , alert: "#{params}"
  end

end
