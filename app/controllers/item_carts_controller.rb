class ItemCartsController < ApplicationController
  before_action :set_item_cart, only: %i[ show edit update destroy ]
  before_action :authenticate_user!, except: [:index, :show]

  # GET /item_carts or /item_carts.json
  def index
    if params[:b_m]
      @item_carts = ItemCart.filterb_m(params[:b_m])
    elsif params[:minimum] and params[:maximum]
      @item_carts = ItemCart.filterperprice(params[:minimum], params[:maximum])
    else
      @item_carts = ItemCart.all
    end
  end

  # GET /item_carts/1 or /item_carts/1.json
  def show
  end

  # GET /item_carts/new
  def new
    @item_cart = ItemCart.new
  end

  # GET /item_carts/1/edit
  def edit
  end

  # POST /item_carts or /item_carts.json
  def create
    @item_cart = ItemCart.new(item_cart_params)

    respond_to do |format|
      if @item_cart.save
        format.html { redirect_to @item_cart, notice: "Item cart was successfully created." }
        format.json { render :show, status: :created, location: @item_cart }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @item_cart.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /item_carts/1 or /item_carts/1.json
  def update
    respond_to do |format|
      if @item_cart.update_attributes(item_cart_params)
        format.html { redirect_to @item_cart, notice: "Item cart was successfully updated." }
        format.json { render :show, status: :ok, location: @item_cart }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @item_cart.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /item_carts/1 or /item_carts/1.json
  def destroy
    @item_cart.destroy
    respond_to do |format|
      format.html { redirect_to item_carts_url, notice: "Item cart was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_item_cart
      @item_cart = ItemCart.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def item_cart_params
      params.require(:item_cart).permit(:quantity, :unit_price, :component_id, :cart_id)
    end
end
