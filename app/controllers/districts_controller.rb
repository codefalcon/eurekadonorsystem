class DistrictsController < ApplicationController
  before_filter :login_required
  before_action :set_district, only: [:show, :edit, :update, :destroy]
  helper_method :sort_column, :sort_direction
  include ApplicationHelper

  # GET /districts
  # GET /districts.json
  def index
    @districts = District.find_all_by_status(Status::Active, :order => sort_column + ' ' + sort_direction)
  end

  # GET /districts/1
  # GET /districts/1.json
  def show
     @blocks = Block.find_all_by_district_id_and_status(params[:id], Status::Active)
  end

  # GET /districts/new
  def new
    @district = District.new
  end

  # GET /districts/1/edit
  def edit
  end

  # POST /districts
  # POST /districts.json
  def create
    @district = District.new(district_params)

    @district.status = Status::Active

    respond_to do |format|
      if @district.save
        format.html { redirect_to districts_path, notice: 'District was successfully created.' }
	format.js { render :js => "close_modal();refresh_page();" }
        format.json { render action: 'show', status: :created, location: @district }
      else
        format.html { render action: 'new' }
        format.json { render json: @district.errors, status: :unprocessable_entity }
	format.js 
      end
    end
  end

  # PATCH/PUT /districts/1
  # PATCH/PUT /districts/1.json
  def update
    @district.status = Status::Active

    respond_to do |format|
      if @district.update(district_params)
        format.html { redirect_to @district, notice: 'District was successfully updated.' }
	format.js { render :js => "close_modal();refresh_page();" }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @district.errors, status: :unprocessable_entity }
	format.js 
      end
    end
  end

  # DELETE /districts/1
  # DELETE /districts/1.json
  def destroy
    @district.status = Status::Inactive

    @district.save

    respond_to do |format|
      format.html { redirect_to districts_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_district
      @district = District.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def district_params
      params.require(:district).permit(:name, :district_code)
    end

   def sort_column
    District.column_names.include?(params[:sort]) ? params[:sort] : "name"
  end
  
  def sort_direction
    %w[asc desc].include?(params[:direction]) ? params[:direction] : "asc"
  end
end
