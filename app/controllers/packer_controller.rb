#This controller just takes User.first.  After login is enabled, this should
#be updated

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
    @packed_ids = (params.select {|inventory_item_id, status| inventory_item_id =~ /^\d+/}).keys.map {|i| i.to_i}

    @items = InventoryItem.where(user_id: @user.id)
    @items.each do |item|
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
