require 'pry'
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

  def show

  end

  def update
    User.update(11111, :name => params[:user][:name])
    redirect_to :action => "profile", :id => 11111
  end

  def edit
    @user = User.find(params[:id])
  end

  def profile
    @user = User.find(params[:id])
  end


  private
  def user_params
    params.require(:user).permit(:name, :emp_id, :password)
  end
end
