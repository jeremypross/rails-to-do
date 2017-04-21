class UsersController < ApplicationController

  def index
    users = User.all

    render :index
  end

  def create
    user = User.create(user_params)

    if user.valid?
      render :json => user, status: 201
    else
      render :json => user.errors, status: 400
    end
  end

  def update
    user_updated = User.find(params[:id]).update_attributes(user_params)

    if user_updated
      head 200
    else
      head 400
    end
  end

  def destroy
    user_destroyed = User.find(params[:id]).destroy

    if user_destroyed
      head 200
    else
      head 400
    end
  end

  def user_params
    params
      .require(:user)
      .permit(:first_name, :last_name, :email, :password)
  end

end
