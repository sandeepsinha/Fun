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
        redirect_to users_dashboard_path
      else
        redirect_to action: 'login', :error => "Invalid Password"
      end
    else
      redirect_to action: 'login', :error => "Invalid Employee Id"
    end
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

  before_action :require_login , :except => [:new, :create, :login, :validate]



  def dashboard
    @user = User.find(session[:user_id])
    @upcoming_events = Event.where(Event.arel_table[:date].gt(Date.today.prev_day))
    @past_events = Event.where(Event.arel_table[:date].lt(Date.today))
  end

  def update
    User.update(session[:user_id], :name => params[:user][:name])
    redirect_to users_dashboard_path
  end

  def edit
    @user = User.find(session[:user_id])
    @error = params[:error]
  end

  def change_password
    if params[:user][:password] == params[:user][:conform_password]
      User.update(session[:user_id], :password => params[:user][:password])
      redirect_to action: 'edit', :error => "Password Changed Sucessfully"
    else
      redirect_to action: 'edit', :error => "Password Miss Matched"
    end
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
