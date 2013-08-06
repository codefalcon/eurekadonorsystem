require 'bcrypt'

class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]
  before_action :load_arrays
  include ApplicationHelper

  # GET /users
  # GET /users.json
  def index
    @users = User.find_all_by_status(Status::Active)
  end

  # GET /users/1
  # GET /users/1.json
  def show	
    
  end

  # GET /users/new
  def new
    @user = User.new
  end

  # GET /users/1/edit
  def edit
     if (@user.status == Status::Inactive)
	flash[:notice] = "This user is not activated."	
	redirect_to "/users"
     end	
  end

  # POST /users
  # POST /users.json
  def create
    @user = User.new(user_params)

    @user.status = Status::Active

    @password = params[:password]

    @user.password_digest = BCrypt::Password.create(@password)

    respond_to do |format|
      if @user.save
        format.html { redirect_to @user, notice: 'User was successfully created.' }
        format.json { render action: 'show', status: :created, location: @user }
      else
        format.html { render action: 'new' }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  def update    
    @user.status = Status::Active

    @password = params[:password]

    if(@password.present?)
        @user.password = @password

        @user.password_confirmation = params[:password_confirmation]

    	@user.password_digest = BCrypt::Password.create(@password)
    end

    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to @user, notice: 'User was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user.status = Status::Inactive

    @user.end_date = Date.today

    respond_to do |format|
      if @user.save
        format.html { redirect_to @user, notice: 'User was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end
  
  private
    # Use callbacks to share common setup or constraints between actions.
    def load_arrays
	@roles = Role.Roles()
   	@genders = Sex.Genders()
    end 

    def set_user
      @user = User.find(params[:id]) 
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:first_name, :last_name, :email_address, :phone_number, :gender, :user_id, :login, :password, :password_confirmation, :role, :start_date, :end_date)
    end
end

