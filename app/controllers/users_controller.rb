class UsersController < ApplicationController

  def index
    users = User.all
    respond_with users
  end

  def show
    user = get_user
    respond_with user
  end

  def new
    user = User.new
    respond_with user
  end

  def create
    user = User.new(user_params)
    if user.save
      redirect_to user
    end
  end

  def edit
    user = get_user
    respond_with user
  end

  def update
    user = get_user
    if user.update(user_params)
      redirect_to user
    else
      redirect_to edit_user_path(user)
    end
  end

  def destroy
    user = get_user
    user.destroy
    redirect_to users_path
  end
  
  private

  def get_user
    User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:email, :user_name, :first_name, :last_name, :password, :password_confirmation)
  end
end
