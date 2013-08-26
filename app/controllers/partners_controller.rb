class PartnersController < ApplicationController
  before_action :set_partner, only: [:show, :edit, :update, :destroy]
  before_filter :login_required
  helper_method :sort_column, :sort_direction
  include ApplicationHelper

  # GET /partners
  # GET /partners.json
  def index
    @partners = Partner.find_all_by_status(Status::Active, :order => sort_column + ' ' + sort_direction)
  end

  # GET /partners/1
  # GET /partners/1.json
  def show
  end

  # GET /partners/new
  def new
    @partner = Partner.new
  end

  # GET /partners/1/edit
  def edit
  end

  # POST /partners
  # POST /partners.json
  def create
    @partner = Partner.new(partner_params)
   
    @partner.status = Status::Active

    respond_to do |format|
      if @partner.save
        format.html { redirect_to @partner, notice: 'Partner was successfully created.' }
	format.js { render :js => "close_modal();refresh_page();" }
        format.json { render action: 'show', status: :created, location: @partner }
      else
        format.html { render action: 'new' }
        format.json { render json: @partner.errors, status: :unprocessable_entity }
	format.js
      end
    end
  end

  # PATCH/PUT /partners/1
  # PATCH/PUT /partners/1.json
  def update
    respond_to do |format|
      if @partner.update(partner_params)
        format.html { redirect_to @partner, notice: 'Partner was successfully updated.' }
	format.js { render :js => "close_modal();refresh_page();" }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @partner.errors, status: :unprocessable_entity }
	format.js
      end
    end
  end

  # DELETE /partners/1
  # DELETE /partners/1.json
  def destroy
    @partner.status = Status::Inactive

    @partner.save

    respond_to do |format|
      format.html { redirect_to partners_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_partner
      @partner = Partner.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def partner_params
      params.require(:partner).permit(:name, :partner_code)
    end


   def sort_column
     Partner.column_names.include?(params[:sort]) ? params[:sort] : "name"
   end
  
   def sort_direction
     %w[asc desc].include?(params[:direction]) ? params[:direction] : "asc"
   end
end
