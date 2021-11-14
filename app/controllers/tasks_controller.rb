class TasksController < ApplicationController

  def index
    @tasks = Task.where(visible: true)
  end

  def show
    # byebug
    @task = Task.find(params[:id])
  end

  def new
    @task = Task.new
  end

  def create
    # byebug
    @task = Task.new(task_params)
    @task.save

    redirect_to tasks_path
  end

  def edit
    @task = Task.find(params[:id])
  end

  def update
    @task = Task.find(params[:id])

    @task = Task.update(task_params)

    redirect_to task_path(@task)

  end

  def destroy
    @task = Task.find(params[:id])
    @task.update(visible: false)

    # we would add a destroy at date as well

    redirect_to tasks_path
  end

  private

  def task_params
    params.require(:task).permit(:title, :details, :completed)
  end
end
