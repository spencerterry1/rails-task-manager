class TasksController < ApplicationController

  # show all tasks
  def index # route: /tasks
    @tasks = Task.all
  end

  # show specific task
  def show # route: /tasks/:id
    @task = Task.find(params[:id])
  end

  # add new task (1. get to new, 2. post to create)
  def new # /tasks/new
    @task = Task.new
  end

  def create # route: /tasks
    @task = Task.new(title: params[:task][:title], details: params[:task][:details])
    @task.save
    redirect_to tasks_path
  end

  # edit task (1. get it, 2. update with patch)
  def edit # route: /tasks/:id/edit
    @task = Task.find(params[:id])
  end

  def update # route: /tasks/:id
    @task = Task.find(params[:id])
    @task.update(task_params)
    @task.save
    redirect_to task_path
  end

  # delete a task
  def destroy # route: /tasks/:id
    @task = Task.find(params[:id])
    @task.destroy
    redirect_to tasks_path
  end

  private

  def task_params
    params.require(:task).permit(:title, :details)
  end

end


