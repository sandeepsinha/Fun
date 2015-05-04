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
        cookies[:login] = { :value => "FUN", :expires => Time.now + 0.10}
        redirect_to action: 'profile'
      else
        redirect_to action: 'login', :error => "Invalid Password"
      end
    else
      @user[:emp_id] = "Invalid"
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
    @user = User.find(session[:user_id])
  end


  private
  def user_params
    params.require(:user).permit(:name, :emp_id, :password)
  end

  def require_login
    if(!session[:user_id] )
      redirect_to action: 'login', :error => 'Your session is completed. Please login again'
    end
  end
end
