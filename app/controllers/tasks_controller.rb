class TasksController < ApplicationController

  def index
    @tasks = Task.all
  end

  def new
    @task = Task.new
  end

  def create
    Task.create(user_params)
  end

  def show
    @task_find = Task.find(params[:id].to_i)
  end

  def edit
    @task_edit = Task.new
  end

  def update
    @task_find = Task.find(params[:id])
    Task.update(user_params)
  end

  def destroy
    @task_find = Task.find(params[:id])
    @task_find.destroy
    redirect_to tasks_path
  end

  private

  def user_params
    params.require(:task).permit(:title, :details, :completed)
  end
end
