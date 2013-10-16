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

    @village.trainer = Villageuser.new
    @village.trainer.role = Role::Block_Trainer
    @village.trainer.status = Status::Active

    @village.teacher_elem = Villageuser.new
    @village.teacher_elem.role = Role::Teacher
    @village.teacher_elem.status = Status::Active
    @village.teacher_elem.grade = 1 

    @village.teacher_mid = Villageuser.new    
    @village.teacher_mid.role = Role::Teacher
    @village.teacher_mid.status = Status::Active
    @village.teacher_mid.grade = 2  

    @village.teacher_high = Villageuser.new  
    @village.teacher_high.role = Role::Teacher
    @village.teacher_high.status = Status::Active
    @village.teacher_high.grade = 3  

    @village.villageinfo = Villageinfo.new
    @village.villageinfo.status = Status::Active

  end

  # GET /villages/1/edit
  def edit
    if(@village.trainer.nil?)
	@village.trainer = Villageuser.new
        @village.trainer.role = Role::Block_Trainer
        @village.trainer.status = Status::Active
    end 

    if(@village.villageinfo.nil?)
	@village.villageinfo = Villageinfo.new
        @village.villageinfo.status = Status::Active
    end 

    if(@village.teacher_elem.nil?)
	    @village.teacher_elem = Villageuser.new
	    @village.teacher_elem.role = Role::Teacher
	    @village.teacher_elem.status = Status::Active
	    @village.teacher_elem.grade = 1 # Elem
    end

    if(@village.teacher_mid.nil?)
	    @village.teacher_mid = Villageuser.new    
	    @village.teacher_mid.role = Role::Teacher
	    @village.teacher_mid.status = Status::Active
	    @village.teacher_mid.grade = 2 # Mid
    end

    if(@village.teacher_high.nil?)
	    @village.teacher_high = Villageuser.new  
	    @village.teacher_high.role = Role::Teacher
	    @village.teacher_high.status = Status::Active
	    @village.teacher_high.grade = 3 # High
    end

  end

  # POST /villages
  # POST /villages.json
  def create
    @village = Village.new(village_params)

    @village.status = Status::Active

    @village.trainer.role = Role::Block_Trainer
    @village.trainer.status = Status::Active

    @village.villageinfo.status = Status::Active

    @village.teacher_elem.role = Role::Teacher
    @village.teacher_elem.status = Status::Active
    @village.teacher_elem.grade = 1 # Elem
     
    @village.teacher_mid.role = Role::Teacher
    @village.teacher_mid.status = Status::Active
    @village.teacher_mid.grade = 2 # Mid

    @village.teacher_high.role = Role::Teacher
    @village.teacher_high.status = Status::Active
    @village.teacher_high.grade = 3 # High

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
    
    @village.trainer.role = Role::Block_Trainer
    @village.trainer.status = Status::Active

    @village.villageinfo.status = Status::Active

    if(@village.teacher_elem.new_record?)
	    @village.teacher_elem.role = Role::Teacher
	    @village.teacher_elem.status = Status::Active
	    @village.teacher_elem.grade = 1 # Elem
    end     

    if(@village.teacher_mid.new_record?)
	    @village.teacher_mid.role = Role::Teacher
	    @village.teacher_mid.status = Status::Active
	    @village.teacher_mid.grade = 2 # Mid
    end

    if(@village.teacher_high.new_record?)
	    @village.teacher_high.role = Role::Teacher
	    @village.teacher_high.status = Status::Active
	    @village.teacher_high.grade = 3 # High
    end

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

    @village.trainer.status = Status::Inactive
    @village.teacher_elem.status = Status::Inactive
    @village.teacher_mid.status = Status::Inactive
    @village.teacher_high.status = Status::Inactive
    @village.villageinfo.status = Status::Inactive

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
      params.require(:village).permit(:name, :village_code, :block_id, trainer_attributes: [:id, :user_id, :start_date, :end_date], villageinfo_attributes: [:id, :funding_status, :total_funding_required, :local_contributions], teacher_elem_attributes: [:id, :user_id, :start_date, :end_date], teacher_mid_attributes: [:id, :user_id, :start_date, :end_date], teacher_high_attributes: [:id, :user_id, :start_date, :end_date])
    end


   def load_arrays
      @blocks = Block.find_all_by_status(Status::Active)

      @trainers = User.find_all_by_role_and_status(Role::Block_Trainer, Status::Active)

      @teachers = User.find_all_by_role_and_status(Role::Teacher, Status::Active)

      @funding_status = FundingStatus.FundingStatuses()
   end 
    
   def sort_column
     Village.column_names.include?(params[:sort]) ? params[:sort] : "name"
   end
  
   def sort_direction
     %w[asc desc].include?(params[:direction]) ? params[:direction] : "asc"
   end
end
