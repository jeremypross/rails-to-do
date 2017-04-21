class TasksController < ApplicationController

  def index
    tasks = User.find(params[:user_id]).tasks

    render :json => tasks, status: 200
  end

  def create
    task = User.find(params[:user_id]).tasks.create(task_params)

    if task.valid?
      render :json => task, status: 201
    else
      render :json => task.errors, status: 400
    end
  end

  def update
    task_updated = User.find(params[:id]).update_attributes(task_params)

    if task_updated
      head 200
    else
      head 400
    end
  end

  def destroy
    task_destroyed = Task.find(params[:id]).destroy

    if task_destroyed
      head 200
    else
      head 400
    end
  end

  def task_params
    params
    .require(:task)
    .permit(:id, :task, :user_id)
  end

end
