class VillageinfosController < ApplicationController
  before_action :set_villageinfo, only: [:show, :edit, :update, :destroy]

  # GET /villageinfos
  # GET /villageinfos.json
  def index
    @villageinfos = Villageinfo.all
  end

  # GET /villageinfos/1
  # GET /villageinfos/1.json
  def show
  end

  # GET /villageinfos/new
  def new
    @villageinfo = Villageinfo.new
  end

  # GET /villageinfos/1/edit
  def edit
  end

  # POST /villageinfos
  # POST /villageinfos.json
  def create
    @villageinfo = Villageinfo.new(villageinfo_params)

    respond_to do |format|
      if @villageinfo.save
        format.html { redirect_to @villageinfo, notice: 'Villageinfo was successfully created.' }
        format.json { render action: 'show', status: :created, location: @villageinfo }
      else
        format.html { render action: 'new' }
        format.json { render json: @villageinfo.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /villageinfos/1
  # PATCH/PUT /villageinfos/1.json
  def update
    respond_to do |format|
      if @villageinfo.update(villageinfo_params)
        format.html { redirect_to @villageinfo, notice: 'Villageinfo was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @villageinfo.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /villageinfos/1
  # DELETE /villageinfos/1.json
  def destroy
    @villageinfo.destroy
    respond_to do |format|
      format.html { redirect_to villageinfos_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_villageinfo
      @villageinfo = Villageinfo.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def villageinfo_params
      params.require(:villageinfo).permit(:village_id, :funding_status, :total_funding_required, :initial_cpi, :ngo_name, :start_date, :end_date, :status, :local_contributions)
    end
end
