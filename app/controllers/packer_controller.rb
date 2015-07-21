#This controller just takes User.first.  After login is enabled, this should
#be updated

class PackerController < ApplicationController
  include SessionsHelper
  before_action :authentication_required

  def allocate
    exp_id = params[:exp_id]
    if signed_in?
      @user = current_user
    end
    @expedition = Expedition.find_by(id: exp_id)
    @inventory_items = @expedition.inventory_items
  end

  def pack_it
    @expedition = Expedition.first
    @user = User.first
    @packed_ids = (params.select {|inventory_item_id, status| inventory_item_id =~ /^\d+/}).keys.map {|i| i.to_i}

    items = InventoryItem.where(user_id: @user.id)
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
