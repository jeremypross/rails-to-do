class TasksController < ApplicationController

  def index
    tasks = User.find(params[:user_id]).tasks
    render :json => tasks, status: 200
  end

  def task_params
    params
    .require(:task)
    .permit(:id, :task, :user_id)
  end

end
