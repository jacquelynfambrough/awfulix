
class SessionsController < ApplicationController

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
    else
      redirect_to session_path
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_path
  end

end
