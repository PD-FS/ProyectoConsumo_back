require 'open-uri'

class DistrictAreasController < ApplicationController
  before_action :set_district_area, only: [:show, :edit, :update, :destroy]

  # GET /district_areas
  # GET /district_areas.json
  def index
    @district_areas = DistrictArea.all
  end

  # GET /district_areas/1
  # GET /district_areas/1.json
  def show
  end

  # GET /district_areas/new
  def new
    @district_area = DistrictArea.new
  end

  # GET /district_areas/1/edit
  def edit
  end

  # POST /district_areas
  # POST /district_areas.json
  def create
    @district_area = DistrictArea.new(district_area_params)

    respond_to do |format|
      if @district_area.save
        format.html { redirect_to @district_area, notice: 'District area was successfully created.' }
        format.json { render :show, status: :created, location: @district_area }
      else
        format.html { render :new }
        format.json { render json: @district_area.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /district_areas/1
  # PATCH/PUT /district_areas/1.json
  def update
    respond_to do |format|
      if @district_area.update(district_area_params)
        format.html { redirect_to @district_area, notice: 'District area was successfully updated.' }
        format.json { render :show, status: :ok, location: @district_area }
      else
        format.html { render :edit }
        format.json { render json: @district_area.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /district_areas/1
  # DELETE /district_areas/1.json
  def destroy
    @district_area.destroy
    respond_to do |format|
      format.html { redirect_to district_areas_url, notice: 'District area was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_district_area
      
	  r = open("http://localhost:3001/district_areas/" + params[:id] + ".json").read
	  #r = open("http://floating-chamber-80486.herokuapp.com/district_areas/1.json").read
	  hash = JSON.parse(r)
	  upzsJSON = hash["upzs"]
	  hash.delete("url")
	  hash.delete("upzs")
	  p hash
	  p upzsJSON
	  @district_area = DistrictArea.new(hash)
	  p @district_area.inspect
	  
	  upzsJSON.each do |currentUPZ|
		@district_area.upzs << Upz.new(currentUPZ)
		end
	rescue 
		  p "EL RECURSOO NO EXISTEEEEEE"
		render json: {}, status: :ok
	end
  
		
    

    # Never trust parameters from the scary internet, only allow the white list through.
    def district_area_params
      params.require(:district_area).permit(:name, :initialZipCode, :lastZipCode, :surfaceArea, :population, :density)
    end
end
