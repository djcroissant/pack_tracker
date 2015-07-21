class ExpeditionsController < ApplicationController
  include SessionsHelper
  before_action :set_expedition, only: [:show, :edit, :update, :destroy]
  before_action :authentication_required

  def index
    if signed_in?
      @user = current_user
      @expeditions = @user.expeditions.order("title")
    end
  end

  def show
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
        format.html { redirect_to @expedition, notice: 'Expedition was successfully created.' }
        format.json { render :show, status: :created, location: @expedition }
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

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_expedition
      @expedition = Expedition.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def expedition_params
      params.require(:expedition).permit(:title, :days)
    end
end
