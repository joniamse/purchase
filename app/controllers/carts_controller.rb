class CartsController < ApplicationController
  before_action :set_cart, only: %i[ show edit update destroy ]
  before_action :authenticate_user!, except: [:index, :show]

  # GET /carts or /carts.json
  def index
    if params[:uname].blank? and params[:from].blank? and params[:to].blank? and params[:max].blank? and params[:brand_id].blank? and params[:minimum].blank? and params[:maximum].blank?
      @carts = Cart.all

    elsif params[:uname]  #FILTRA POR NOMBRE ESTANDO EN BLANCO COUNTRY
      @carts = Cart.filteruname(params[:uname]) unless params[:uname].blank?

    elsif params[:from] and params[:to]
      @carts = Cart.filterfromto(params[:from], params[:to])
    
    elsif params[:max]
      @carts = Cart.filterprice(params[:max])
    elsif params[:brand_id]
      @carts = Cart.filterbrand(params[:brand_id])
    elsif params[:minimum] and params[:maximum]
      @carts = Cart.filterperunit(params[:minimum], params[:maximum])
    end

  end

  # GET /carts/1 or /carts/1.json
  def show
  end

  # GET /carts/new
  def new
    @cart = Cart.new
  end

  # GET /carts/1/edit
  def edit
  end

  # POST /carts or /carts.json
  def create
    @cart = Cart.new(cart_params)

    respond_to do |format|
      if @cart.save
        format.html { redirect_to @cart, notice: "Cart was successfully created." }
        format.json { render :show, status: :created, location: @cart }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @cart.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /carts/1 or /carts/1.json
  def update
    respond_to do |format|
      if @cart.update_attributes(cart_params)
        format.html { redirect_to @cart, notice: "Cart was successfully updated." }
        format.json { render :show, status: :ok, location: @cart }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @cart.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /carts/1 or /carts/1.json
  def destroy
    @cart.destroy
    respond_to do |format|
      format.html { redirect_to carts_url, notice: "Cart was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_cart
      @cart = Cart.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def cart_params
      params.require(:cart).permit(:user_name, :user_id, :bill_date)
    end
end
