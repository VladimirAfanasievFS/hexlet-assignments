# frozen_string_literal: true

class TasksController < ApplicationController
  def index
    @tasks = Task.all
  end

  def show
    @task = Task.find params[:id]
  end

  def new
    @task = Task.new
  end

  def edit
    @task = Task.find params[:id]
  end

  def create
    @task = Task.new(task_params)

    @user = @task.create_user(user_params)
    @status = @task.create_status(status_params)

    if @task.save
      redirect_to @task, notice: 'Task was successfully created.'
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    @task = Task.find params[:id]

    if @task.update(task_params)
      redirect_to @task, notice: 'Task was successfully updated.'
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @task = Task.find params[:id]

    @task.destroy

    redirect_to tasks_url, notice: 'Task was successfully destroyed.'
  end

  private

  # Only allow a list of trusted parameters through.
  def task_params
    params.require(:task).permit(:name, :description)
  end
  def user_params
    params.require(:task).require(:user).permit(:name)
  end
  def status_params
    params.require(:task).require(:status).permit(:name)
  end
end
