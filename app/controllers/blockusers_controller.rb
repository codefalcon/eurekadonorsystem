class BlockusersController < ApplicationController
  before_action :set_blockuser, only: [:show, :edit, :update, :destroy]

  # GET /blockusers
  # GET /blockusers.json
  def index
    @blockusers = Blockuser.all
  end

  # GET /blockusers/1
  # GET /blockusers/1.json
  def show
  end

  # GET /blockusers/new
  def new
    @blockuser = Blockuser.new
  end

  # GET /blockusers/1/edit
  def edit
  end

  # POST /blockusers
  # POST /blockusers.json
  def create
    @blockuser = Blockuser.new(blockuser_params)

    respond_to do |format|
      if @blockuser.save
        format.html { redirect_to @blockuser, notice: 'Blockuser was successfully created.' }
        format.json { render action: 'show', status: :created, location: @blockuser }
      else
        format.html { render action: 'new' }
        format.json { render json: @blockuser.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /blockusers/1
  # PATCH/PUT /blockusers/1.json
  def update
    respond_to do |format|
      if @blockuser.update(blockuser_params)
        format.html { redirect_to @blockuser, notice: 'Blockuser was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @blockuser.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /blockusers/1
  # DELETE /blockusers/1.json
  def destroy
    @blockuser.destroy
    respond_to do |format|
      format.html { redirect_to blockusers_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_blockuser
      @blockuser = Blockuser.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def blockuser_params
      params.require(:blockuser).permit(:block_id, :user_id, :role, :start_date, :end_date, :status)
    end
end
