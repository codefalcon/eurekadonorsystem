class DonorvillagesController < ApplicationController
  before_action :set_donorvillage, only: [:show, :edit, :update, :destroy]

  # GET /donorvillages
  # GET /donorvillages.json
  def index
    @donorvillages = Donorvillage.all
  end

  # GET /donorvillages/1
  # GET /donorvillages/1.json
  def show
  end

  # GET /donorvillages/new
  def new
    @donorvillage = Donorvillage.new
  end

  # GET /donorvillages/1/edit
  def edit
  end

  # POST /donorvillages
  # POST /donorvillages.json
  def create
    @donorvillage = Donorvillage.new(donorvillage_params)

    respond_to do |format|
      if @donorvillage.save
        format.html { redirect_to @donorvillage, notice: 'Donorvillage was successfully created.' }
        format.json { render action: 'show', status: :created, location: @donorvillage }
      else
        format.html { render action: 'new' }
        format.json { render json: @donorvillage.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /donorvillages/1
  # PATCH/PUT /donorvillages/1.json
  def update
    respond_to do |format|
      if @donorvillage.update(donorvillage_params)
        format.html { redirect_to @donorvillage, notice: 'Donorvillage was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @donorvillage.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /donorvillages/1
  # DELETE /donorvillages/1.json
  def destroy
    @donorvillage.destroy
    respond_to do |format|
      format.html { redirect_to donorvillages_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_donorvillage
      @donorvillage = Donorvillage.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def donorvillage_params
      params.require(:donorvillage).permit(:village_id, :user_id, :start_date, :end_date, :amount_for_village, :status)
    end
end
