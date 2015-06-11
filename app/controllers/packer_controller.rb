class PackerController < ApplicationController
  def allocate
    @inventory_items=InventoryItem.all
    @climbers=Climber.all
  end

end
