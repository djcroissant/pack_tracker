class PackerController < ApplicationController
  def allocate
    @inventory_items=InventoryItem.all
    @climbers=Climber.all
  end

  def pack_it
    @params = params
    #redirect_to packer_allocate_path , alert: "#{params}"
  end

end
