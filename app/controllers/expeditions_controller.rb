class ExpeditionsController < ApplicationController
  include SessionsHelper
  before_action :set_expedition, only: [:show, :edit, :update, :destroy]
  before_action :authentication_required

  def index
    @user = current_user
    @expeditions = @user.expeditions.order("title")
  end


  def new
    @expedition = Expedition.new
  end

  def edit
  end

  def create
    @expedition = Expedition.new(expedition_params)

    respond_to do |format|
      if @expedition.save
        @expedition.users << current_user
        format.html { redirect_to upcoming_expedition_path, notice: 'Expedition was successfully created.' }
        format.json { render :get, status: :created, location: upcoming_expedition_path }
      else
        format.html { render :new }
        format.json { render json: @expedition.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @expedition.update(expedition_params)
        format.html { redirect_to @expedition, notice: 'Expedition was successfully updated.' }
        format.json { render :show, status: :ok, location: @expedition }
      else
        format.html { render :edit }
        format.json { render json: @expedition.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @expedition.destroy
    respond_to do |format|
      format.html { redirect_to expeditions_url, notice: 'Expedition was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def upcoming
    @expeditions = Expedition.where("start_date > ?", Date.today).
                              order("start_date ASC, title ASC")
    @user = current_user
  end

  def join
    expedition = Expedition.find_by(id: params[:expedition_id])
    expedition.users << current_user
    redirect_to upcoming_expedition_path, notice: "You successfully joined #{expedition.title ? expedition.title.titleize : 'the expedition'}"
  end

  def unjoin
    expedition = Expedition.find_by(id: params[:expedition_id])
    expedition.users.delete(current_user)
    redirect_to expeditions_path, notice: "You successfully left #{expedition.title ? expedition.title.titleize : 'the expedition'}"
  end

  def details
    exp_id = params[:exp_id]
    @user = current_user
    @expedition = Expedition.find_by(id: exp_id)
    @users = @expedition.users
    @expedition_inventory = @expedition.inventory_items
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_expedition
      @expedition = Expedition.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def expedition_params
      params.require(:expedition).permit(:title, :days, :start_date)
    end
end
