class VillagesummaryreportsController < ApplicationController
  before_action :set_villagesummaryreport, only: [:show, :edit, :update, :destroy]

  # GET /villagesummaryreports
  # GET /villagesummaryreports.json
  def index
    @villagesummaryreports = Villagesummaryreport.all
  end

  # GET /villagesummaryreports/1
  # GET /villagesummaryreports/1.json
  def show
  end

  # GET /villagesummaryreports/new
  def new
    @villagesummaryreport = Villagesummaryreport.new
  end

  # GET /villagesummaryreports/1/edit
  def edit
  end

  # POST /villagesummaryreports
  # POST /villagesummaryreports.json
  def create
    @villagesummaryreport = Villagesummaryreport.new(villagesummaryreport_params)

    respond_to do |format|
      if @villagesummaryreport.save
        format.html { redirect_to @villagesummaryreport, notice: 'Villagesummaryreport was successfully created.' }
        format.json { render action: 'show', status: :created, location: @villagesummaryreport }
      else
        format.html { render action: 'new' }
        format.json { render json: @villagesummaryreport.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /villagesummaryreports/1
  # PATCH/PUT /villagesummaryreports/1.json
  def update
    respond_to do |format|
      if @villagesummaryreport.update(villagesummaryreport_params)
        format.html { redirect_to @villagesummaryreport, notice: 'Villagesummaryreport was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @villagesummaryreport.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /villagesummaryreports/1
  # DELETE /villagesummaryreports/1.json
  def destroy
    @villagesummaryreport.destroy
    respond_to do |format|
      format.html { redirect_to villagesummaryreports_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_villagesummaryreport
      @villagesummaryreport = Villagesummaryreport.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def villagesummaryreport_params
      params.require(:villagesummaryreport).permit(:village_id, :children_enrolled, :children_attended, :class_working_days, :current_cpi, :activities_html, :start_date, :end_date)
    end
end
