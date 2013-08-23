class VillagesController < ApplicationController
  include ApplicationHelper
  before_filter :login_required
  before_action :set_village, only: [:show, :edit, :update, :destroy]
  before_action :load_arrays
  helper_method :sort_column, :sort_direction

  # GET /villages
  # GET /villages.json
  def index
    @villages = Village.find_all_by_status(Status::Active, :order => sort_column + ' ' + sort_direction)
  end

  # GET /villages/1
  # GET /villages/1.json
  def show
  end

  # GET /villages/new
  def new
    @village = Village.new
  end

  # GET /villages/1/edit
  def edit
  end

  # POST /villages
  # POST /villages.json
  def create
    @village = Village.new(village_params)

    @village.status = Status::Active

    respond_to do |format|
      if @village.save
        format.html { redirect_to villages_path, notice: 'Village was successfully created.' }
        format.js { render :js => "close_modal();refresh_page();" }
        format.json { render action: 'show', status: :created, location: @village }
      else
        format.html { render action: 'new' }
        format.json { render json: @village.errors, status: :unprocessable_entity }
        format.js
      end
      
    end
  end

  # PATCH/PUT /villages/1
  # PATCH/PUT /villages/1.json
  def update
    respond_to do |format|
      if @village.update(village_params)
	format.html { redirect_to villages_path, notice: 'Village was successfully updated.' }
        format.js { render :js => "close_modal();refresh_page();" }
        format.json { head :no_content }		
      else
        format.html { render action: 'edit' }
        format.json { render json: @village.errors, status: :unprocessable_entity }        
        format.js
      end      
    end
  end

  # DELETE /villages/1
  # DELETE /villages/1.json
  def destroy
    @village.status = Status::Inactive

    @village.save

    respond_to do |format|
      format.html { redirect_to villages_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_village
      @village = Village.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def village_params
      params.require(:village).permit(:name, :village_code, :block_id)
    end


   def load_arrays
      @blocks = Block.find_all_by_status(Status::Active)
   end 
    
   def sort_column
     Village.column_names.include?(params[:sort]) ? params[:sort] : "name"
   end
  
   def sort_direction
     %w[asc desc].include?(params[:direction]) ? params[:direction] : "asc"
   end
end
