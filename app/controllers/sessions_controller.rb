
class SessionsController < ApplicationController
require 'bcrypt'

  def new
    @user = User.new
    render :new
  end

  def create
    user_params = params.require(:user).permit(:email, :password)
    @user = User.confirm(user_params)
    if @user
      login(@user)
      redirect_to @user
      flash[:success] = "Logged in!"
    else
      flash[:error] = "Login unsuccessful, please check your username and password and try again."
      redirect_to login_path
    end
  end

  def destroy
    session[:user_id] = nil
    flash[:success] = "Successfully logged out"
    redirect_to root_path
  end

end
