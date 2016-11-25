class TaskUsersController < ApplicationController
  before_action :set_task_user, only: [:show, :edit, :update, :destroy]

  # GET /task_users
  # GET /task_users.json
  def index
    @task_users = TaskUser.all
  end

  # GET /task_users/1
  # GET /task_users/1.json
  def show
  end

  # GET /task_users/new
  def new
    @task_user = TaskUser.new
  end

  # GET /task_users/1/edit
  def edit
  end

  # POST /task_users
  # POST /task_users.json
  def create
    @task_user = TaskUser.new(task_user_params)

    respond_to do |format|
      if @task_user.save
        format.html { redirect_to @task_user, notice: 'Task user was successfully created.' }
        format.json { render :show, status: :created, location: @task_user }
      else
        format.html { render :new }
        format.json { render json: @task_user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /task_users/1
  # PATCH/PUT /task_users/1.json
  def update
    respond_to do |format|
      if @task_user.update(task_user_params)
        format.html { redirect_to @task_user, notice: 'Task user was successfully updated.' }
        format.json { render :show, status: :ok, location: @task_user }
      else
        format.html { render :edit }
        format.json { render json: @task_user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /task_users/1
  # DELETE /task_users/1.json
  def destroy
    @task_user.destroy
    respond_to do |format|
      format.html { redirect_to task_users_url, notice: 'Task user was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_task_user
      @task_user = TaskUser.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def task_user_params
      params.fetch(:task_user, {})
    end
end
