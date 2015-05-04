require 'pry'
class UsersController < ApplicationController
  def index
  end

  def login
    reset_session
    @user = User.new
    @error = params[:error]
  end

  def validate
    @user = User.new
    if User.exists?(params[:user][:emp_id])
      @user = User.find(params[:user][:emp_id])
      if @user[:password] == params[:user][:password]
        session[:user_id] = @user[:emp_id]
        session[:expiry_time] = 10.seconds.from_now
        redirect_to users_dashboard_path
      else
        redirect_to action: 'login', :error => "Invalid Password"
      end
    else
      redirect_to action: 'login', :error => "Invalid Employee Id"
    end
  end

  before_action :require_login , :except => [:login, :validate]

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to new_users_path
    end
  end

  def dashboard
    @user = User.find(session[:user_id])
  end

  def update
    User.update(session[:user_id], :name => params[:user][:name])
    redirect_to :action => 'dashboard'
  end

  def edit
    @user = User.find(session[:user_id])
  end

  private
  def user_params
    params.require(:user).permit(:name, :emp_id, :password)
  end

  def require_login
    if !session[:user_id]
      redirect_to action: 'login'
    end
  end
end
