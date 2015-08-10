class PackerController < ApplicationController
  include SessionsHelper
  before_action :authentication_required

  def allocate
    expedition_id = params[:expedition_id]
    @user = current_user
    @expedition = Expedition.find_by(id: expedition_id)
    @inventory_items = @user.inventory_items.order("title")
  end

  def pack_it
    expedition_id = params[:expedition_id].to_i
    @expedition = Expedition.find_by(id: expedition_id)
    @user = current_user
    #what user selected to include in packing list
    @packed_ids = (params.select {|inventory_item_id, status| inventory_item_id =~ /^\d+/}).keys.map {|i| i.to_i}
    #what is already included in this user's packing list for this expedition
    @expedition_snapshot = @expedition.inventory_items.where(user_id: @user.id).map{|i| i.id}
    #all the items for this user
    @items = InventoryItem.where(user_id: @user.id)

    @items.each do |item|
      if @packed_ids.include?(item.id) && !@expedition_snapshot.include?(item.id)
        item.expeditions << @expedition
      elsif !@packed_ids.include?(item.id) && @expedition_snapshot.include?(item.id)
        item.expeditions.delete(@expedition)
      end
    end
    redirect_to packing_list_path(expedition_id: @expedition.id)
  end

  def packing_list
    expedition_id = params[:expedition_id]
    @user = current_user
    @expedition = Expedition.find_by(id: expedition_id)
    @items = @expedition.inventory_items.where(user_id: @user.id).order("title")
  end

  def welcome
  end

  def summary

  end



end
