class VillageusersController < ApplicationController
  before_action :set_villageuser, only: [:show, :edit, :update, :destroy]

  # GET /villageusers
  # GET /villageusers.json
  def index
    @villageusers = Villageuser.all
  end

  # GET /villageusers/1
  # GET /villageusers/1.json
  def show
  end

  # GET /villageusers/new
  def new
    @villageuser = Villageuser.new
  end

  # GET /villageusers/1/edit
  def edit
  end

  # POST /villageusers
  # POST /villageusers.json
  def create
    @villageuser = Villageuser.new(villageuser_params)

    respond_to do |format|
      if @villageuser.save
        format.html { redirect_to @villageuser, notice: 'Villageuser was successfully created.' }
        format.json { render action: 'show', status: :created, location: @villageuser }
      else
        format.html { render action: 'new' }
        format.json { render json: @villageuser.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /villageusers/1
  # PATCH/PUT /villageusers/1.json
  def update
    respond_to do |format|
      if @villageuser.update(villageuser_params)
        format.html { redirect_to @villageuser, notice: 'Villageuser was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @villageuser.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /villageusers/1
  # DELETE /villageusers/1.json
  def destroy
    @villageuser.destroy
    respond_to do |format|
      format.html { redirect_to villageusers_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_villageuser
      @villageuser = Villageuser.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def villageuser_params
      params.require(:villageuser).permit(:village_id, :user_id, :role, :start_date, :end_date, :status)
    end
end
