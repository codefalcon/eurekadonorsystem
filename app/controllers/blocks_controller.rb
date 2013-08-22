class BlocksController < ApplicationController
  before_filter :login_required
  before_action :set_block, only: [:show, :edit, :update, :destroy]
  helper_method :sort_column, :sort_direction
  before_action :load_arrays
  include ApplicationHelper

  # GET /blocks
  # GET /blocks.json
  def index
    @district_id = params[:district_id] 

    if(@district_id.blank?)
	@blocks = Block.order(sort_column + " " + sort_direction)
    else 
	@blocks = Block.find_all_by_district_id(@district_id, :order => sort_column + " " + sort_direction)
    end 
  end

  # GET /blocks/1
  # GET /blocks/1.json
  def show
  end

  # GET /blocks/new
  def new
    @block = Block.new

    @block.manager = Blockuser.new  do |m| 
	m.status = Status::Active
	m.role = Role::Project_Manager
    end 
    @block.director = Blockuser.new do |d| 
	d.status = Status::Active
 	d.role = Role::Project_Director
    end
  end

  # GET /blocks/1/edit
  def edit
  end

  # POST /blocks
  # POST /blocks.json
  def create
    @block = Block.new(block_params)
    @block.status = Status::Active

    @block.manager.status = Status::Active
    @block.director.status = Status::Active 
    @block.manager.role = Role::Project_Manager
    @block.director.role = Role::Project_Director

    respond_to do |format|
      if @block.save!
        format.html { redirect_to blocks_path, notice: 'Block was successfully created.' }
	format.js { render :js => "close_modal();refresh_page();" }
        format.json { render action: 'show', status: :created, location: @block }
      else
        format.html { render action: 'new' }
        format.json { render json: @block.errors, status: :unprocessable_entity }
 	format.js
      end
    end
  end

  # PATCH/PUT /blocks/1
  # PATCH/PUT /blocks/1.json
  def update
    respond_to do |format|
      if @block.update(block_params)
        format.html { redirect_to @block, notice: 'Block was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @block.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /blocks/1
  # DELETE /blocks/1.json
  def destroy
    @block.destroy
    respond_to do |format|
      format.html { redirect_to blocks_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_block
      @block = Block.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def block_params
      if(params[:block].present?)
	 params.require(:block).permit(:name, :block_code, :district_id, manager_attributes: [:id, :user_id, :start_date, :end_date], director_attributes: [:id, :user_id, :start_date, :end_date])
      end
    end

   def load_arrays
      @districts = District.find_all_by_status(Status::Active)
	
      @managers = User.find_all_by_role_and_status(Role::Project_Manager, Status::Active)

      @directors = User.find_all_by_role_and_status(Role::Project_Director, Status::Active)

      @trainers = User.find_all_by_role_and_status(Role::Block_Trainer, Status::Active)
   end 

   def sort_column
     Block.column_names.include?(params["sort"]) ? params["sort"] : "name"
   end
  
  def sort_direction
    %w[asc desc].include?(params["direction"]) ? params["direction"] : "asc"
  end
end
