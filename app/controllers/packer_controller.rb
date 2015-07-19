#This controller just takes Climber.first.  After login is enabled, this should
#be updated

class PackerController < ApplicationController
  include SessionsHelper

  def allocate
    @expedition = Expedition.first
    @climber = Climber.first
    @inventory_items = @climber.inventory_items
  end

  def pack_it
    @expedition = Expedition.first
    @climber = Climber.first
    @packed_ids = (params.select {|inventory_item_id, status| inventory_item_id =~ /^\d+/}).keys.map {|i| i.to_i}

    items = InventoryItem.where(climber_id: @climber.id)
    items.each do |item|
      if @packed_ids.include?(item.id)
        if item.expeditions.where(id: @expedition.id).empty?
          item.expeditions << @expedition
        end
      else
        if item.expeditions.where(id: @expedition.id).present?
          item.expeditions.delete(@expedition)
        end
      end
    end
  end

  def welcome
    if !signed_in?
      redirect_to login_path
    end
  end



end
