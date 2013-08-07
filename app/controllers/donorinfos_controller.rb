class DonorinfosController < ApplicationController
  before_filter :login_required
  before_action :set_donorinfo, only: [:show, :edit, :update, :destroy]

  # GET /donorinfos
  # GET /donorinfos.json
  def index
    @donorinfos = Donorinfo.all
  end

  # GET /donorinfos/1
  # GET /donorinfos/1.json
  def show
  end

  # GET /donorinfos/new
  def new
    @donorinfo = Donorinfo.new
  end

  # GET /donorinfos/1/edit
  def edit
  end

  # POST /donorinfos
  # POST /donorinfos.json
  def create
    @donorinfo = Donorinfo.new(donorinfo_params)

    respond_to do |format|
      if @donorinfo.save
        format.html { redirect_to @donorinfo, notice: 'Donorinfo was successfully created.' }
        format.json { render action: 'show', status: :created, location: @donorinfo }
      else
        format.html { render action: 'new' }
        format.json { render json: @donorinfo.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /donorinfos/1
  # PATCH/PUT /donorinfos/1.json
  def update
    respond_to do |format|
      if @donorinfo.update(donorinfo_params)
        format.html { redirect_to @donorinfo, notice: 'Donorinfo was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @donorinfo.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /donorinfos/1
  # DELETE /donorinfos/1.json
  def destroy
    @donorinfo.destroy
    respond_to do |format|
      format.html { redirect_to donorinfos_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_donorinfo
      @donorinfo = Donorinfo.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def donorinfo_params
      params.require(:donorinfo).permit(:user_id, :type, :amount_donated, :amount_used, :start_date, :end_date, :status)
    end
end
