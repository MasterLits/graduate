class UsersController < ApplicationController

  load_and_authorize_resource

  before_action :set_user, only: [:show, :edit, :update, :destroy]

  # GET /users
  # GET /users.json


  # GET /users/1
  # GET /users/1.json
  def show

  end

  def edit_profile

  end

  def delete_user_assigned_task
    task=current_user.assigned_users_tasks.find_by(task_id: params[:format])
    task.destroy
    redirect_to profile_path
  end


  def get_profile
    @profile=current_user
    @task_notifications = current_user.task_notifications
  end



  # GET /users/new
  def new
    @user = User.new
  end

  # GET /users/1/edit
  def edit
  end

  # POST /users
  # POST /users.json
  def create
    #@user = @task.users.create(user_params)
    @user = @task.users.create(user_params)
    respond_to do |format|
      if @user.save
        flash[:notice]="Успешная регистрация"
      else
        format.html { render :new }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  def assign_task
    current_user.assign_task(params[:task_id])
    flash[:notice] = "Вы взялись выполнять новое задание "
    redirect_to profile_path
  end

  def assigned_tasks
    @asstasks = current_user.assigned_tasks
  end




  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to profile_path, notice: 'Профиль был успешно обновлен' }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_url, notice: 'Профиль был успешно удален' }
      format.json { head :no_content }
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_user
    @user = User.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :login, :password, :photo, :tel, :role, :inn, :passport, :description)
  end

end
