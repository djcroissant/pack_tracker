class PackedItemsController < ApplicationController
  before_action :set_packed_item, only: [:show, :edit, :update, :destroy]

  # GET /packed_items
  # GET /packed_items.json
  def index
    @packed_items = PackedItem.all
  end

  # GET /packed_items/1
  # GET /packed_items/1.json
  def show
  end

  # GET /packed_items/new
  def new
    @packed_item = PackedItem.new
  end

  # GET /packed_items/1/edit
  def edit
  end

  # POST /packed_items
  # POST /packed_items.json
  def create
    @packed_item = PackedItem.new(packed_item_params)

    respond_to do |format|
      if @packed_item.save
        format.html { redirect_to @packed_item, notice: 'Packed item was successfully created.' }
        format.json { render :show, status: :created, location: @packed_item }
      else
        format.html { render :new }
        format.json { render json: @packed_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /packed_items/1
  # PATCH/PUT /packed_items/1.json
  def update
    respond_to do |format|
      if @packed_item.update(packed_item_params)
        format.html { redirect_to @packed_item, notice: 'Packed item was successfully updated.' }
        format.json { render :show, status: :ok, location: @packed_item }
      else
        format.html { render :edit }
        format.json { render json: @packed_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /packed_items/1
  # DELETE /packed_items/1.json
  def destroy
    @packed_item.destroy
    respond_to do |format|
      format.html { redirect_to packed_items_url, notice: 'Packed item was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_packed_item
      @packed_item = PackedItem.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def packed_item_params
      params.require(:packed_item).permit(:title, :description, :weight)
    end
end
