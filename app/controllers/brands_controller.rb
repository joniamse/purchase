class BrandsController < ApplicationController
  before_action :set_brand, only: %i[ show edit update destroy ]
  before_action :authenticate_user!, except: [:index, :show]

  # GET /brands or /brands.json
  def index
    if params[:country].blank? and params[:name].blank?
      @brands = Brand.all

    elsif params[:name] and params[:country].blank?  #FILTRA POR NOMBRE ESTANDO EN BLANCO COUNTRY
      @brands = Brand.filtername(params[:name]) unless params[:name].blank?

    elsif params[:name].blank? and params[:country]   #FILTRA POR COUNTRY ESTANDO EN BLANCO NAME
      @brands = Brand.filtercountreia(params[:country]) unless params[:country].blank?

    elsif params[:name] and params[:country]   #FILTRA POR COUNTRY Y NAME JUNTOS
      @brands = Brand.filterambos(params[:name], params[:country])

    end
  end

  # GET /brands/1 or /brands/1.json
  def show
  end

  # GET /brands/new
  def new
    @brand = Brand.new
  end

  # GET /brands/1/edit
  def edit
  end

  # POST /brands or /brands.json
  def create
    @brand = Brand.new(brand_params)

    respond_to do |format|
      if @brand.save
        format.html { redirect_to @brand, notice: "Brand was successfully created." }
        format.json { render :show, status: :created, location: @brand }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @brand.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /brands/1 or /brands/1.json
  def update
    respond_to do |format|
      if @brand.update_attributes(brand_params)
        format.html { redirect_to @brand, notice: "Brand was successfully updated." }
        format.json { render :show, status: :ok, location: @brand }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @brand.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /brands/1 or /brands/1.json
  def destroy
    @brand.destroy
    respond_to do |format|
      format.html { redirect_to brands_url, notice: "Brand was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_brand
      @brand = Brand.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def brand_params
      params.require(:brand).permit(:name, :country)
    end
end
