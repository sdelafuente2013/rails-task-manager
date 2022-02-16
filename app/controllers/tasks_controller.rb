class TasksController < ApplicationController
  before_action :set_tasks, only: [:show, :update, :destroy]
  def index
    @tasks = Task.all
  end

  def new
    @task = Task.new
  end

  def create
    Task.create(user_params)
    redirect_to tasks_path
  end

  def show
    @task = Task.new
  end

  def edit
    @task = Task.new
  end

  def update
    @task_find.update(user_params)
  end

  def destroy
    @task_find.destroy
    redirect_to tasks_path
  end

  private

  def user_params
    params.require(:task).permit(:title, :details, :completed)
  end

  def set_tasks
    @task_find = Task.find(params[:id])
  end
end
