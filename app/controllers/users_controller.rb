class UsersController < ApplicationController
  def index
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to new_users_path
    end
  end

  def user_params
    params.require(:user).permit(:name, :emp_id, :password)
  end
end
